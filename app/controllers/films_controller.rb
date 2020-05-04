# frozen_string_literal: true

class FilmsController < ApplicationController
  def index
    render json: scope
  end

  def scope
    FilmCarrier.wrap(Film.all).map do |film|
      {
        title: film.title,
        genre: film.genre,
        rate:  film.avg_rating
      }
    end
  end
end
