class AddForeignKeysToBookSongs < ActiveRecord::Migration[5.2]
  def change
    rename_table :books_songs, :book_songs
    add_foreign_key :book_songs, :books
    add_foreign_key :book_songs, :songs
  end
end
