# frozen_string_literal: true

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
    films_scope.map do |film|
      { title: film.title, genre: film.genre, rate: films_rates[film.id] }
    end
  end

  def films_rates
    @films_rates ||= films_scope.includes(:reviews).group(:film_id).average(:rate)
  end
end
