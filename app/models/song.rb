# frozen_string_literal: true

class Song < ApplicationRecord
  has_and_belongs_to_many :books
  belongs_to :author
  validates :title, length: { maximum: 45 }
  validates :title, :author_id, presence: true

  scope :published, -> { where(published: true) }

  def self.search(term)
    if term
      songs = Song.arel_table
      # authors = Author.arel_table
      Song.where(songs[:title].matches("%#{term}%"))
      # Author.where(authors[:name].matches("%#{term}%"))
      # where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end

  def self.is_already_added?(not_added_songs, song_id)
    not_added_songs&.each do |song|
      return false if song.id == song_id
    end
  end

  def publish
    update(published: true)
  end

  def unpublish
    update(published: false)
  end
end
