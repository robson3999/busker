# frozen_string_literal: true

class AddAuthorToSongsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :songs
    create_table :songs do |t|
      t.string :title
      t.string :text
      t.string :author
      t.belongs_to :book, index: true

      t.timestamps
    end
  end
end
