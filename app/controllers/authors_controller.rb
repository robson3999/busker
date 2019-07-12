# frozen_string_literal: true

class AuthorsController < ApplicationController
  # don't show authors without any songs
  def index
    @authors = if params[:term]
                 Author.search(params[:term]).paginate(page: params[:page], per_page: 5)
               else
                 Author.all.paginate(page: params[:page], per_page: 5)
               end
  end

  def show
    @author = Author.find_by_id(params[:id])
    author_id = @author.id
    @songs = @author.songs.paginate(page: params[:page], per_page: 5)
  end
end
