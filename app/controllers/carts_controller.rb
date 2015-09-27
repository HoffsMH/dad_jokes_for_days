class CartsController < ApplicationController
  def create
    session[:cart] ||= {}
    #check if added item is already in session
    #if no, add order_item.id to session, otherwise increment
    if order_item_in_session
      OrderItem.increment_counter(:quantity, item_in_session.id)
    else
      order_item = OrderItem.create(jasdfkjasdf)
      session[:cart] << order_item.id
    end

    session[:cart][params[:item_id]] ||= 0
    session[:cart][params[:item_id]] += 1

    flash[:notice] = 'Added ' + Item.find_by_dao(params[:item_id]).name
    redirect_to cart_path
  end

  def order_item_in_session
    order_item_ids = session[:cart].delete("[", "]").split(",")
    OrderItem.where(id: order_item_ids, joke_id: session[:joke_id], item_id: item.id).first
  end






  def show
    @cart_items = if session[:cart] && !session[:cart].empty?
      session[:cart].map do |item_dao, quantity|
        CartItem.new(item_dao, quantity)
      end
    end
    @cart_total = grand_total if @cart_items
  end

  def update
    if new_quantity > 0
      session[:cart][params[:id]] = new_quantity
      flash[:notice] = "Quantity updated"
    else
      item = Item.find_by_dao(params[:id])
      flash[:notice] = "Successfully removed <a href='/items/#{item.dao}'>#{item.name}</a> from your cart."
      session[:cart].delete(params[:id])
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
      params[:item][:quantity].to_i
    elsif params[:commit] == "Remove"
      0
    end
  end

end
