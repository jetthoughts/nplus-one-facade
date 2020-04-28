class Film < ApplicationRecord
  has_many :reviews, inverse_of: :film, dependent: :destroy

  validates :title, presence: true
  validates :genre, presence: true
end
