class CartsController < ApplicationController

  def create
    item = Item.find_by_dao(params[:item_id])

    session_handler = SessionHandler.new(session)
    session_handler.add_cart_item(item)

    flash[:notice] = 'Added ' + item.name
    redirect_to cart_path
  end

  def show
    @order_items = OrderItem.where(id: session[:cart])
    @cart_total = @order_items.sum(:subtotal)
    @user = current_user
    session[:target_page] = '/cart'
  end

  def update
    order_item = OrderItem.find(params[:order_item][:order_item_id])
    if new_quantity > 0
      order_item.update(quantity: new_quantity)
      flash[:notice] = "Quantity updated"
    else
      SessionHandler.new(session).remove_cart_item(order_item)
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
end
