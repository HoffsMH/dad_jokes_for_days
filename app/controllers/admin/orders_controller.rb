class Admin::OrdersController < Admin::AdminController

  def update
    order = Order.find(params[:order_id])
    old_status = order.status
    order.update(status: params[:new_status])
    flash[:notice] = "Order ##{order.id} changed from '#{old_status}' to '#{params[:new_status]}'"
    redirect_to admin_dashboard_path
  end

  def show
    @order = Order.find(params[:order_id])
  end

end
