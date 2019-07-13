# frozen_string_literal: true

class AuthorsController < ApplicationController
  expose :authors, -> { authors_from_params }
  expose :author
  expose :songs, -> { author.songs.paginate(page: params[:page], per_page: 5) }

  private

  def authors_from_params
    return Author.search(params[:term]).paginate(page: params[:page], per_page: 5) if params[:term]

    Author.all.paginate(page: params[:page], per_page: 5)
  end
end
