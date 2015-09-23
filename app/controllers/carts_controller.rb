class CartsController < ApplicationController
  def create
    if session[:cart]
      if session[:cart][params[:item_id]]
        session[:cart][params[:item_id]]  += 1
      else
        session[:cart][params[:item_id]] = 1
      end
    else
      session[:cart] = {params[:item_id] => 1}
    end
    @cart_items = session[:cart]

    flash[:notice] = 'Added '  + Item.find_by_dao(params[:item_id]).name
    redirect_to '/cart'
  end

  def show
    if session[:cart]
      @cart_items = session[:cart]
    else
      @cart_items = ["No Cart Items"]
    end
  end
end
