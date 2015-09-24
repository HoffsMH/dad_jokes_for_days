class UsersController < ApplicationController
  def new

  end

  def create
    if session[:user]
      flash[:notice] = 'Please log out before creating a new user'
      redirect_to controller: 'welcome', action: 'index'
    end

    user = User.new(new_user_params)
    if user.save
      flash[:notice] = 'user successfully created'
      redirect_to controller: 'welcome', action: 'index'
    else
      flash[:notice] = user.errors.full_messages.first
      redirect_to action: 'new'
    end
  end

  private
  def new_user_params
    params.require(:new_user).permit(:email, :user_name, :password, :password_confirmation)
  end
end
