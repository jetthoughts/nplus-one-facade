# frozen_string_literal: true

module SqlView
  class FilmsController < ApplicationController
    def index
      render json: scope
    end

    def scope
      AvgRating.all.map do |avg_rating|
        {
          title: avg_rating.film_title,
          genre: avg_rating.film_genre,
          rate:  avg_rating.avg_rate
        }
      end
    end
  end
end
