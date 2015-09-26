class WelcomeController < ApplicationController

  def index
    @items = Item.all.sample(3)
    @jokes = Joke.all.sample(3)
    @joke = Joke.all.sample
  end

end
