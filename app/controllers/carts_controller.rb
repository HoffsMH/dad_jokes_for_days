class CartsController < ApplicationController
  def create
    session[:cart] ||= []
    #check if added item is already in session
    #if no, add order_item.id to session, otherwise increment
    if !session[:cart].empty? && order_item_in_session
      OrderItem.increment_counter(:quantity, item_in_session.id)
    else
      item_id = Item.find_by_dao(params[:item_id]).id
      order_item = OrderItem.create(item_id: item_id,
                                    joke_id: session[:joke_id], quantity: 1)
      session[:cart] << order_item.id
    end

    flash[:notice] = 'Added ' + Item.find_by_dao(params[:item_id]).name
    redirect_to cart_path
  end

  def show
    @order_items = OrderItem.where(id: session[:cart])
  end

  def update
    if new_quantity > 0
      OrderItem.find(params[:order_item][:order_item_id])
      flash[:notice] = "Quantity updated"
    else
      order_item = OrderItem.find(params[:order_item][:order_item_id]).delete
      session[:cart].delete(order_item.id)
      flash[:notice] = "Successfully removed <a href=\"/items/#{order_item.item.dao}\">#{order_item.item.name}</a> from your cart."
    end

    redirect_to cart_path
  end

  def destroy
    session.delete(:cart)
    flash[:notice] = "Cart deleted!"
    redirect_to cart_path
  end

  private

  def grand_total
    @cart_items.reduce(0){|sum, cart_item| sum += cart_item.total}
  end

  def new_quantity
    if params[:commit] == "Update Quantity"
      params[:order_item][:quantity].to_i
    elsif params[:commit] == "Remove"
      0
    end
  end

  def order_item_in_session
    # order_item_ids = session[:cart].delete("[]").split(",")
    item = Item.find_by_dao(params[:item_id])
    OrderItem.where(id: session[:cart], joke_id: session[:joke_id], item_id: item.id).first
  end

end
