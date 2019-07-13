# frozen_string_literal: true

class BooksController < ApplicationController
  expose :books, -> { Book.where("user_id = '?'", current_user&.id) }
  expose :book

  def index
    redirect_to root_path unless current_user
  end

  def show
    redirect_to root_path unless current_user
    session[:book_id] = params[:id]

    # TODO: move to separate method
    book.songs.destroy(params[:remove_song_from_book]) if params[:remove_song_from_book].present?
  end

  def export_to_pdf
    book = Book.find(params[:id])
    @songs = book.songs
  end

  def create
    book.user_id = current_user.id if current_user
    if book.save
      redirect_to book, notice: I18n.t('books.actions.create.success')
    else
      render :new
    end
  end

  def update
    return render :edit unless book.update(book_params)

    redirect_to book, notice: I18n.t('books.actions.update.success')
  end

  def destroy
    session[:book_id] = nil
    unless book.destroy
      flash[:now] = I18n.t('notifs.error')
      return render :show
    end

    redirect_to books_url, notice: I18n.t('books.actions.destroy.success')
  end

  private

  def book_params
    params.require(:book).permit(:title, :description)
  end
end
