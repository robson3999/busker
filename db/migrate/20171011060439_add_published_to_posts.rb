class AddPublishedToPosts < ActiveRecord::Migration[5.1]
  def change
    change_table :songs do |t|
      t.boolean :published, default: :false
    end
  end
end
