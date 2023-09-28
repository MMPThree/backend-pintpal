class Review < ApplicationRecord
  belongs_to :beer
  belongs_to :user

  validates :city, :state, :review_text, :rating, :beer_id, :user_id, :username, presence: true

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  validates :review_text, length: { minimum: 5, maximum: 1000 }

  validates :username, format: { with: /\A[a-zA-Z0-9]+\z/, message: "can only contain letters and numbers" }
end