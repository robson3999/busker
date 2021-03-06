# frozen_string_literal: true

class AddUserIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :user_id, :integer
    add_index :books, :user_id
  end
end
