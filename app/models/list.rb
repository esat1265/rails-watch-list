class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true

  # Other attributes: ...

  def destroy_with_bookmarks
    destroy
  end
end
