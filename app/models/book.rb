class Book < ApplicationRecord
  has_and_belongs_to_many :songs
  belongs_to :user

  # Maybe implemented in future 
  # def self.has_song?(id)
  #
  # end

end
