class Author < ApplicationRecord
  has_many :songs

  def self.search(term)
    if term
      authors = Author.arel_table
      Author.where(authors[:name].matches("%#{term}%"))
    else
      all
    end
  end

end
