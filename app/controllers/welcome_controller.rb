class WelcomeController < ApplicationController

  def index
    @jokes = Joke.all.sample(3)
    @joke = Joke.all.sample
  end

end
