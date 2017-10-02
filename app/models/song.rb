class Song < ApplicationRecord
  belongs_to :book

  def self.search(term)
    if term
      where('title || author LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
