# frozen_string_literal: true

class BooksController < ApplicationController
  expose :books, -> { Book.where("user_id = '?'", current_user&.id) }
  expose :book

  def show
    session[:book_id] = params[:id]

    if params[:remove_song_from_book].present?
      song = Song.find_by_id(params[:remove_song_from_book])
      song.books.delete(@book)
    end
  end

  def export_to_pdf
    book = Book.find(params[:id])
    @songs = book.songs
  end

  def create
    book.user_id = current_user.id if current_user
    if book.save
      redirect_to book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    return render :edit unless book.update(book_params)

    redirect_to book, notice: 'Book was successfully updated.'
  end

  def destroy
    session[:book_id] = nil
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description)
  end
end
