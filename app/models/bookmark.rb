class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }

  # Other attributes: ...

  # Custom validation for unique [movie, list] pairings
  validate :unique_movie_list_pairing

  private

  def unique_movie_list_pairing
    if Bookmark.exists?(movie_id: movie_id, list_id: list_id)
      errors.add(:base, "This movie is already bookmarked in the list.")
    end
  end
end
