class AvgRating < ApplicationRecord
  self.primary_key = :id

  belongs_to :film

  def self.refresh
    Scenic.database.refresh_materialized_view(table_name, concurrently: false, cascade: false)
  end
end
