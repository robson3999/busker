class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :text
      t.string :tag

      t.timestamps
    end
  end
end
