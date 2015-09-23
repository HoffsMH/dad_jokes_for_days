class CartsController < ApplicationController
  def create
    if session[:cart]
      session[:cart][params[:item_id]] += 1
    else

      session[:cart] = {params[:item_id] => 1}
    end
    @cart_items = session[:cart]

    redirect_to '/cart'

  end

  def index

  end

  def show
  end
end
