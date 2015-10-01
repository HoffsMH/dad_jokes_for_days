class Admin::UsersController < Admin::AdminController
  def show
    @user = current_user
    @orders = current_user.orders
    @all_orders = Order.all.order(created_at: :desc).
    paginate(:page => params[:page], :per_page => 40)
  end

  def update
  end
end
