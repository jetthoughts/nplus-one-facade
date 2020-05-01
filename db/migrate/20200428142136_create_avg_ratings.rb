class CreateAvgRatings < ActiveRecord::Migration[6.0]
  def change
    create_view :avg_ratings
  end
end
