class Admin::UsersController < Admin::AdminController

  def show
    if !current_user.admin?
      redirect_to 404
    end
  end

end
