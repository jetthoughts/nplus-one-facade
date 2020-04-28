# frozen_string_literal: true

class FilmCarrier
  delegate_missing_to :@film

  def initialize(film, cached_stats: nil)
    @film = film
    @cached_ratings_stats = cached_stats || calculate_stats(film)
  end

  def avg_rating
    @cached_ratings_stats[:avg_ratings][@film.id]
  end

  def self.wrap(film_scope)
    films = film_scope.to_a

    cache = {
      avg_ratings: calculate_totals(films),
    }

    films.map { |film| FilmCarrier.new(film, cached_stats: cache) }
  end


  def self.calculate_totals(films)
    Review
      .where(film_id: films.pluck(:id))
      .group(:film_id)
      .average(:rate)
  end

  def calculate_stats(film)
    {
      avg_ratings: { film.id => film.avg_rating }
    }
  end
end
