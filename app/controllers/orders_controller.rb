class OrdersController < ApplicationController

  def create
    if current_user
      order = Order.create(status: "complete", user_id: session[:user])
      order.order_items << OrderItem.where(id: session[:cart])
      session.delete(:cart)
      flash[:notice] = "Thank you for your order!"
      redirect_to dashboard_path
    else
      flash[:notice] = "You must log in before checking out"
        session[:target_page] = checkout_path
      redirect_to login_path
    end
  end

  def edit

  end

end
