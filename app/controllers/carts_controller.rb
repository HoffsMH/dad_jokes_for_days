class CartsController < ApplicationController
  def create
    session[:cart] ||= {}
    session[:cart][params[:item_id]] ||= 0
    session[:cart][params[:item_id]] += 1
    @cart_items = session[:cart]

    flash[:notice] = 'Added ' + Item.find_by_dao(params[:item_id]).name
    redirect_to cart_path
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
    if params[:commit] == "Update Quantity"
      new_quantity = params[:item][:quantity].to_i
    elsif params[:commit] == "Delete"
      new_quantity = 0
    end

    if new_quantity > 0
      session[:cart][params[:id]] = new_quantity
    else
      session[:cart].delete(params[:id])
    end
    flash[:notice] = "Quantity updated"
    redirect_to cart_path
  end

  def destroy
    byebug
    session[:cart].delete(params[:id])
  end

  private

  def grand_total
    @cart_items.reduce(0){|sum, cart_item| sum += cart_item.total}
  end

end
