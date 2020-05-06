class Film < ApplicationRecord
  has_many :reviews, inverse_of: :film, dependent: :destroy
  has_one  :avg_rating

  validates :title, presence: true
  validates :genre, presence: true

  def avg_rating
    reviews.average(:rate)
  end
end
