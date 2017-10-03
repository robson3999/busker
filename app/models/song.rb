class Song < ApplicationRecord
  has_and_belongs_to_many :books

  def self.search(term)
    if term
      where('title || author LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
