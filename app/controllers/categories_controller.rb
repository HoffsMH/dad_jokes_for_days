class CategoriesController < ApplicationController
  # before_action :load_category, only: [:show, :edit, :update, :destroy]
  # before_action :authorize
  #
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by_dao(params[:id])
  end
  # def new
  #   @category = Category.new
  # end
  #
  # def create
  #   Category.create(category_params)
  #   redirect_to categories_path
  # end


  # def edit
  # end
  #
  # def update
  #   @category.update(category_params)
  #   flash.notice = "Category name changed to #{@category.name}!"
  #   redirect_to categories_path
  # end
  #
  # def destroy
  #   ideas = @category.ideas
  #   count = ideas.count
  #   if count > 0
  #     ideas.each do |idea|
  #       idea.destroy
  #     end
  #     flash.alert = "Heads up, you deleted a category that was being used. #{count} idea(s) deleted."
  #   end
  #
  #   @category.delete
  #   flash.notice = "'#{@category.name}' Category deleted!"
  #   redirect_to categories_path
  # end

  private

    # def category_params
    #   params.require(:category).permit(:name)
    # end
    #
    # def load_category
    #   @category = Category.find(params[:id])
    # end

    # def authorize
    #   if !current_user.admin?
    #     render plain: "Only an admin can mess with categories... make sure you're logged in."
    #   end
    # end

end
