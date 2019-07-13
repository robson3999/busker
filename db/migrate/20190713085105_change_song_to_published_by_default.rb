class ChangeSongToPublishedByDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :songs, :published, :boolean, default: true
  end
end
