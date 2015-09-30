class Admin::UsersController < Admin::AdminController

  def show
    @user = current_user
    @orders = current_user.orders
    @all_orders = Order.all.order(created_at: :desc)
  end

  def update

  end

end
