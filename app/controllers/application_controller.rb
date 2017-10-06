class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # GET /
  def index
    @songs = Song.last(3).reverse
  end

  # GET /about
  def about
  end

end
