class CreateSongsAndBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :songs_books do |t|
    	t.belongs_to :song, index: true
    	t.belongs_to :book, index: true
    end
  end
end
