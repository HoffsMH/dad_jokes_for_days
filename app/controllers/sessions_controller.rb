class SessionsController < ApplicationController
  def create
    session[:joke_id] = params[:joke_id]
    redirect_to items_path
  end
end
