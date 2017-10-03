class RemoveBookIdFromSongs < ActiveRecord::Migration[5.1]
  def up
  	remove_column :songs, :book_id
  end
end
