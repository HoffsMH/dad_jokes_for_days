class Admin::ItemsController < Admin::AdminController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end
end
