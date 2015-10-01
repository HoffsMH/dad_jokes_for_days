class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if current_user
      @orders = current_user.orders
      @user = current_user
    else
      flash[:notice] = "Please login before trying to view your account information."
      redirect_to root_path
    end
  end

  def create
    user = User.new(new_user_params)
    byebug
    if user.save
      session[:user] = user.id
      flash[:notice] = 'user successfully created'
      redirect_to dashboard_path
    else
      flash[:alert] = user.errors.full_messages.first
      redirect_to action: 'new'
    end
  end

  def update
    current_user.update(update_user_params)
    current_user.save
    flash[:notice] = "You have successfully updated your information!"
    redirect_to dashboard_path
  end

  private

  def new_user_params
    params.require(:user).permit(:email, :user_name, :password,
      :password_confirmation, :first, :last, :street, :city, :state, :zip)
  end

  def update_user_params
    params.require(:user).permit(:email, :user_name, :first, :last, :street,
      :city, :state, :zip)
  end
end
