class SessionsController < ApplicationController
  def create
    session[:joke_id] = params[:joke_id]
    if params[:joke_id]
      redirect_to items_path
    else
      user ||=  User.find_by_email(params[:user][:email])
      if user && user.authenticate(params[:user][:password])
        session[:user] = user.id
        flash[:notice] = "Welcome: #{user.user_name}"
        redirect_to controller: 'welcome', action: 'index'
      else
        flash[:notice] = "Invalid Login"
        redirect_to action: 'new'
      end
    end
  end

  def new

  end
end
