class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:name)
  end
end
