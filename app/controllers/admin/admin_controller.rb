class Admin::AdminController < ApplicationController
  before_action :authorized?

  def authorized?
    if current_user.nil? || !current_user.admin?
      render plain: "404", status: 404
    end
  end
end
