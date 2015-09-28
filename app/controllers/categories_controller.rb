class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_dao(params[:category])
    @items = @category.items
  end
end
