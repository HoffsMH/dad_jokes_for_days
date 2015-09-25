class SessionsController < ApplicationController

  def new
  end

  def create
    user ||=  User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user] = user.id
      flash[:notice] = "The Dad welcomes you, #{user.user_name}."
      redirect_to root_path
    else
      flash[:notice] = "Invalid Login"
      redirect_to action: 'new'
    end
  end

  def update
    session[:joke_id] = params[:joke_id]
    redirect_to items_path
  end

  def destroy
    flash[:notice] = "Successfully logged out. See you next time, #{current_user.user_name}."
    session[:user] = nil
    redirect_to root_path
  end

end
