# frozen_string_literal: true

class SongsController < ApplicationController
  expose :song
  expose :songs, -> { songs_from_params }
  expose :book, -> { Book.find_by(id: session[:book_id]) }

  def index
    unless book.nil?
      added_songs = book.songs
      @not_added_songs = Song.all - added_songs
    end

    return unless params[:add_song_to_book].present? && session[:book_id].present?

    book.songs << Song.find(params[:add_song_to_book])
    redirect_to songs_path
  end

  def user_songs
    @songs = if current_user.try(:admin?)
               Song.all
             else
               Song.where(user_id: current_user.id)
             end
  end

  def publish
    song.publish
    redirect_to user_songs_url
  end

  def unpublish
    song.unpublish
    redirect_to user_songs_url
  end

  def new
    @user_id = current_user.id
  end

  def edit
    @user_id = current_user.id
  end

  def song_params_updated
    author_params = {}
    author = Author.find_by(name: song_params[:author])
    if author
      author_params[:author_id] = author.id
    else
      song_author = Author.create(name: song_params[:author])
      author_params[:author_id] = song_author.id
    end
    song_params.merge(author_params).except(:author)
  end

  def create
    song = current_user.songs.build(song_params_updated)
    if song.save
      redirect_to song, notice: I18n.t('songs.actions.create.success')
    else
      render :new
    end
  end

  def update
    if song.update(song_params_updated)
      redirect_to song, notice: I18n.t('songs.actions.update.success')
    else
      render :edit
    end
  end

  def destroy
    song.destroy
    song.author.destroy if song.author.songs.empty?

    redirect_to songs_url, notice: I18n.t('songs.actions.destroy.success')
  end

  private

  def songs_from_params
    if params[:term]
      Song.search(params[:term]).published.paginate(page: params[:page], per_page: 5)
    else
      Song.published.paginate(page: params[:page], per_page: 5)
    end
  end

  def song_params
    params.require(:song).permit(:title, :body, :author, :user_id, :term)
  end
end
