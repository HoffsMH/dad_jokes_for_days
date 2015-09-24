class ItemsController < ApplicationController
  def index
    @items = Item.all
    @random_joke = Joke.all.sample
  end
end
