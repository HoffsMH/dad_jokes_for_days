class CartsController < ApplicationController
  def create
    session[:cart] ||= {}
    session[:cart][params[:item_id]] ||= 0
    session[:cart][params[:item_id]] += 1
    @cart_items = session[:cart]

    flash[:notice] = 'Added ' + Item.find_by_dao(params[:item_id]).name
    redirect_to '/cart'
  end

  def show
    @cart_items = if session[:cart]
      session[:cart].map do |item_dao, quantity|
        CartItem.new(item_dao, quantity)
      end
    end
    @cart_total = grand_total
  end

  private

  def grand_total
    @cart_items.reduce(0){|sum, cart_item| sum += cart_item.total}
  end

end
