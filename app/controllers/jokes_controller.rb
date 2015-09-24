  class JokesController < ApplicationController

    def index
      @jokes = Joke.all
    end

    def current_joke
      session[:joke_id] = @joke.id
      redirect_to items_path
    end

    def random_joke
      @random_joke = Joke.all.sample

      redirect_to items_path
    end

    private

    def all_jokes
      @jokes = Joke.all
      params[:current_joke] = @joke.id
    end

  end
