class RemoveAuthorNameFromSongs < ActiveRecord::Migration[5.1]
    def up
      remove_column :songs, :author
    end
  end
