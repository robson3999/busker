# frozen_string_literal: true

class Song < ApplicationRecord
  has_many :book_songs
  has_many :books, through: :book_songs

  belongs_to :author
  belongs_to :user

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

  def already_added?(not_added_songs)
    not_added_songs&.each do |song|
      return false if song.id == id
    end
  end

  def publish
    update(published: true)
  end

  def unpublish
    update(published: false)
  end
end
