class Admin::ItemsController < Admin::AdminController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def update
    dao = params[:id]
    item = Item.find_by_dao(dao)
    if item.update(item_params)
      flash[:notice] = "Item successfully updated!"
      redirect_to admin_items_path
    else
      flash[:notice] = item.errors.full_messages
      redirect_to "/admin/items/#{dao}/edit"
    end
  end

  def edit
    @item = Item.find_by_dao(params[:id])
    @categories = Category.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      flash[:notice] = "New item '#{item.name}' created."
      redirect_to admin_items_path
    else
      flash[:notice] = item.errors.full_messages
      redirect_to new_admin_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url,
                                 :category_id, :price, :status)
  end
end
