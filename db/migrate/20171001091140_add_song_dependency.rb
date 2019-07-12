# frozen_string_literal: true

class AddSongDependency < ActiveRecord::Migration[5.1]
  def change
    change_table :songs do |t|
      t.belongs_to :book, index: true
    end
  end
end
