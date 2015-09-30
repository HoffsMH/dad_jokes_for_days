class Admin::ItemsController < Admin::AdminController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create

    item = Item.new(item_params)
    
    byebug
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :image_url, :category_id, :price, :image_url)
  end
end
