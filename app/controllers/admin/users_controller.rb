class Admin::UsersController < Admin::AdminController

  def show
    @user = current_user
    @orders = current_user.orders
  end

  def update

  end

end
