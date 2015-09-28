class Admin::AdminController < ApplicationController
  before_action :authorized?

  def authorized?
    if !current_user.admin?
      redirect_to 404
    end
  end
end
