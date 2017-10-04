class Song < ApplicationRecord
  has_and_belongs_to_many :books
  validates :title, :author, length: {maximum: 45 }
  validates :title, :text, :author, presence: true

  def self.search(term)
    if term
      where('title || author LIKE ?', "%#{term}%")
    else
      all
    end
  end

  def self.is_already_added?(not_added_songs, song_id)
    if not_added_songs
      not_added_songs.each do |song|
        if song.id == song_id
          return false
        end
      end
    end
  end

end
