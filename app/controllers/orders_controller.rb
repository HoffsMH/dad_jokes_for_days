class OrdersController < ApplicationController

  def create
    if current_user
      # order = Order.create(status: "pending", user_id: session[:user])
      # order.order_items << Order_item.where(id: session[:cart])
      redirect_to checkout_path
    else
      flash[:notice] = "You must log in before checking out"
      session[:target_page] = checkout_path
      redirect_to login_path
    end
  end

  def edit

  end

end
