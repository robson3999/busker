class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # GET /
  def index
    @songs = Song.last(3).reverse
  end

  # GET /about
  def about
  end

  def author
    @author = Author.find_by_id(params[:id])
    author_id = @author.id
    @songs = @author.songs
  end

  def authors
    @authors = []
    all_authors = Author.all
    all_authors.each do |author|
      if !author.songs.empty?
        @authors << author
      end
    end
  end

end
