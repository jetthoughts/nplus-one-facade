# frozen_string_literal: true

module SqlView
  class FilmsController < ApplicationController
    def index
      render json: find_films
    end

    private

    def find_films
      AvgRating.select(:film_title, :film_genre, :avg_rate).as_json(except: :id)
    end
  end
end
