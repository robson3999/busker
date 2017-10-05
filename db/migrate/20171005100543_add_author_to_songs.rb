class AddAuthorToSongs < ActiveRecord::Migration[5.1]
  def change
    change_table :songs do |t|
      t.belongs_to :author
    end
  end
end
