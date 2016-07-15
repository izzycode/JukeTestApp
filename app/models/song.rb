class Song < ApplicationRecord

  belongs_to :playlist

  def self.search(term)
    where('LOWER(name) LIKE :term OR LOWER(artist) LIKE :term', term: "%#{term.downcase}%")
  end
end
