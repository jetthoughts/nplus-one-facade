# frozen_string_literal: true

class Film < ApplicationRecord
  has_many :reviews, inverse_of: :film, dependent: :destroy

  validates :title, presence: true
  validates :genre, presence: true

  def avg_rating
    reviews.average(:rate)
  end

end
