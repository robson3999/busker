# frozen_string_literal: true

class BookSong < ApplicationRecord
  belongs_to :book
  belongs_to :song
end
