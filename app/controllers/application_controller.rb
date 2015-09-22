class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_categories

  helper_method :category_path

  def category_path(category)
    category.dao.prepend('/')
  end

  def load_categories
    @categories = Category.all
  end
end
