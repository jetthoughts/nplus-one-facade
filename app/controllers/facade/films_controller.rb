# frozen_string_literal: true

module Facade
  class FilmsController < ApplicationController
    def index
      @films = serialized_films
      render json: @films
    end

    private

    def films_scope
      Film.all
    end

    def serialized_films
      FilmCarrier.wrap(films_scope).map do |film|
        { title: film.title, genre: film.genre, rate: film.avg_rating }
      end
    end
  end
end
