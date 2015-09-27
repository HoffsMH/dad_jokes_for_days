class CartsController < ApplicationController
  def create
    session[:cart] ||= {}
    session[:cart][params[:item_id]] ||= 0
    session[:cart][params[:item_id]] += 1
    
    flash[:notice] = 'Added ' + Item.find_by_dao(params[:item_id]).name
    redirect_to cart_path
  end
  
  def show
    if current_user
      @user_message = current_user.user_name
    else
      @user_message = "Please Log in before checking out"
    end
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
