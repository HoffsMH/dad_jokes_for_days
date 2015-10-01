class ItemsController < ApplicationController
  def index
    @items = Item.all.order(:name)
    @random_joke = Joke.all.sample
  end

  def show
    @item = Item.find_by_dao(params[:id])
  end
end
