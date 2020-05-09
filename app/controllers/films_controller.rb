# frozen_string_literal: true

class FilmsController < ApplicationController
  def index
    @films = serialized_films
    render json: @films
  end

  def serialized_films
    Film.all.map do |film|
      {
        title: film.title,
        genre: film.genre,
        rate: film.reviews.average(:rate)
      }
    end
  end
end
