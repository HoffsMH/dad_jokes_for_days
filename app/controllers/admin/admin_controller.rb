class Admin::AdminController < ApplicationController
  before_action :authorized?

  def authorized?
    if current_user.nil? || !current_user.admin?
      render_404
    end
  end

  private

  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404",
                    :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
