class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # GET /
  def index
    @songs = Song.last(3)
  end

end
