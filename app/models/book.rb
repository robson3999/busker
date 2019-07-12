# frozen_string_literal: true

class Book < ApplicationRecord
  has_and_belongs_to_many :songs
  belongs_to :user
  validates :title, presence: true
  validates :title, length: { maximum: 30 }

  # Maybe implemented in future
  # def self.has_song?(id)
  #
  # end
end
