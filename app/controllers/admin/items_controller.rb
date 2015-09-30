class Admin::ItemsController < Admin::AdminController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def update
    item = Item.find(params[:item][:item_id])
    item.update(item_params)
    redirect_to admin_items_path
  end

  def edit
    @item = Item.find_by_dao(params[:id])
    @categories = Category.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to admin_items_path
    else
      flash[:notice] = item.errors.full_messages
      redirect_to new_admin_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url,
                                 :category_id, :price, :image_url, :status)
  end
end
