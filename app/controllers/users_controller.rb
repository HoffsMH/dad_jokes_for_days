class UsersController < ApplicationController

  def new
  end

  def show
    if current_user
      @orders = current_user.orders
    else
      flash[:notice] = "Please login before trying to view your account information."
      redirect_to root_path
    end
  end

  def create
    if session[:user]
      flash[:alert] = 'Please log out before creating a new user'
      redirect_to controller: 'welcome', action: 'index'
    end

    user = User.new(new_user_params)
    if user.save
      session[:user] = user.id
      flash[:notice] = 'user successfully created'
      redirect_to dashboard_path
    else
      flash[:alert] = user.errors.full_messages.first
      redirect_to action: 'new'
    end
  end

  private

  def new_user_params
    params.require(:new_user).permit(:email, :user_name, :password, :password_confirmation)
  end

end
