class WelcomeController < ApplicationController
  def index
    @item = Item.all.sample
    @jokes = Joke.all.sample(3)
    @joke = Joke.all.sample
  end
end
