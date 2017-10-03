class ChangeTableName < ActiveRecord::Migration[5.1]
  def up
  	rename_table :songs_books, :books_songs
  end
end
