# frozen_string_literal: true

class FilmsController < ApplicationController
  def index
    render json: scope
  end

  def scope
    Film.all.map do |film|
      {
        title: film.title,
        genre: film.genre,
        rate: film.reviews.average(:rate)
      }
    end
  end
end
