# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :book_songs
  has_many :songs, through: :book_songs
  belongs_to :user
  validates :title, presence: true
  validates :title, length: { maximum: 100 }
end
