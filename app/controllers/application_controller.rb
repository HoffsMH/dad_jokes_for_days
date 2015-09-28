class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :load_categories

  helper_method :category_path, :cart_path, :current_joke, :current_user, :grand_total

  def category_path(category)
    "/" + category.dao
  end

  def current_joke
    Joke.find(session[:joke_id]) if session[:joke_id]
  end

  def load_categories
    @categories = Category.all
  end

  def current_user
    User.find(session[:user]) if session[:user]
  end

  def grand_total(order_items)
    order_items.reduce(0){|sum, cart_item| sum += cart_item.total}
  end

end
