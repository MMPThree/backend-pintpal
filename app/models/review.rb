class Review < ApplicationRecord
  belongs_to :beer
  belongs_to :user
  validates :city, :state, :review_text, :rating, :beer_id, :user_id, presence: true
end
