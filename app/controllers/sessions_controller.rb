class SessionsController < ApplicationController

  def new
  end

  def create
    user ||=  User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user] = user.id
      flash[:notice] = "The Dad welcomes you, #{user.user_name}."
        if session[:previous_page]
          session.delete(:previous_page)
          redirect_to checkout_path
        else
          redirect_to dashboard_path
        end
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
