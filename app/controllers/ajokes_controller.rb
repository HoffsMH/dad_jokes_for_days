class AjokesController < ApplicationController
  def show
    respond_to do |format|
      format.js 
      format.html {render text: "hi"}
    end
  end
end
