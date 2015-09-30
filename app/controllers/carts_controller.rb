class CartsController < ApplicationController











  def create
    item = Item.find_by_dao(params[:item_id])

    session_handler = SessionHandler.new(session)
    session_handler.add_cart_item(item)

    flash[:notice] = 'Added ' + item.name
    redirect_to cart_path
  end











  def show
    @cart_total = grand_total(OrderItem.where(id: session[:cart]))
    @order_items = OrderItem.where(id: session[:cart])
    @user = current_user
    session[:target_page] = '/cart'
  end

  def update
    if new_quantity > 0
      OrderItem.find(params[:order_item][:order_item_id]).
                            update(quantity: params[:order_item][:quantity])
      flash[:notice] = "Quantity updated"
    else
      order_item = OrderItem.find(params[:order_item][:order_item_id]).destroy
      session[:cart].delete(order_item.id)
      flash[:notice] = "Successfully removed <a href=\"/items/#{order_item.item.dao}\">#{order_item.item.name}</a> from your cart."
    end

    redirect_to cart_path
  end

  def destroy
    OrderItem.where(id: session[:cart]).destroy_all
    session.delete(:cart)
    flash[:notice] = "Cart deleted!"
    redirect_to cart_path
  end

  private

  def new_quantity
    if params[:commit] == "Update Quantity"
      params[:order_item][:quantity].to_i
    elsif params[:commit] == "Remove"
      0
    end
  end

  def order_item_in_session
    item = Item.find_by_dao(params[:item_id])
    OrderItem.where(id: session[:cart], joke_id: session[:joke_id], item_id: item.id).first
  end

end
