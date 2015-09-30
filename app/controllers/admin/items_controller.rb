class Admin::ItemsController < Admin::AdminController
  def index
    @items = Item.all
  end

  def new
  end
end
