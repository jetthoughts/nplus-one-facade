class Review < ApplicationRecord
  belongs_to :film, inverse_of: :reviews
end
