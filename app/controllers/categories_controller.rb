class CategoriesController < ApplicationController
  # before_action :load_category, only: [:show, :edit, :update, :destroy]
  # before_action :authorize
  #
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_dao(params[:category])
    @items = @category.items
  end
end
