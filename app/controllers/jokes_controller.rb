  class JokesController < ApplicationController

    def index
      @jokes = Joke.all
    end

  end
