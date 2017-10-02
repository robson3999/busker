class Song < ApplicationRecord
  belongs_to :book

  # attr_accessor :title, :text, :author

  def self.show_song(file)
    file.readlines
  end

end
