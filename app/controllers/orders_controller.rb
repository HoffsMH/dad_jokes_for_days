class OrdersController < ApplicationController

  def create
    if current_user
      redirect_to checkout_path
    else
      flash[:notice] = "You must log in before checking out"
      redirect_to login_path
    end
  end

  def edit

  end

end
