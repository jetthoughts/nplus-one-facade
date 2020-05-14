class CreateFilmRatings < ActiveRecord::Migration[6.0]
  def change
    create_view :film_ratings, materialized: true
  end
end
