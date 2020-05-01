# frozen_string_literal: true

require 'test_helper'

class AvgRatingTest < ActiveSupport::TestCase
  test 'store the rating with related film id' do
    AvgRating.refresh

    films_with_avg_rates = Film.all.sort_by(&:id).map do |film|
      { film.id => rates_amount(film) / film.reviews.count.to_f }
    end
    avg_ratings_films_with_rates = AvgRating.all.sort_by(&:id).map do |avg_rating|
      { avg_rating.id => avg_rating.avg.to_f }
    end

    assert_equal films_with_avg_rates, avg_ratings_films_with_rates
  end

  def rates_amount(film)
    film.reviews.pluck(:rate).sum
  end
end
