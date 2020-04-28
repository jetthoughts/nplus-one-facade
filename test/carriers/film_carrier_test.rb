# frozen_string_literal: true

require 'test_helper'

class FilmCarrierTest < ActiveSupport::TestCase
  test 'calculate rate for single film' do
    film = Film.find_by(title: 'Season of the Fake Blow')
    film_carrier = FilmCarrier.new(film)
    assert_equal 35, film_carrier.avg_rating
  end

  test 'wrap films scope with pre-calculated ratings' do
    film_carriers = FilmCarrier.wrap(Film.all)
    assert_equal 35, film_carriers.first.avg_rating
  end
end
