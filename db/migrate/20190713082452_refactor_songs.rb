class RefactorSongs < ActiveRecord::Migration[5.2]
  def change
    rename_column :songs, :text, :body
    add_foreign_key :songs, :users
  end
end