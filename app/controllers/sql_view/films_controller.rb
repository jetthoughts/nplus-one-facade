# frozen_string_literal: true

module SqlView
  class FilmsController < ApplicationController
    def index
      render json: scope
    end

    def scope
      AvgRating.all.map do |avg_rating|
        {
          title: avg_rating.title,
          genre: avg_rating.genre,
          rate:  avg_rating.avg
        }
      end
    end
  end
end
