class OrdersController < ApplicationController
  def create
    order = Order.create(status: "ordered", user_id: session[:user])
    order.order_items << OrderItem.where(id: session[:cart])
    session.delete(:cart)
    flash[:notice] = "Thank you for your order!"
    redirect_to dashboard_path
  end

  def edit
  end
end
