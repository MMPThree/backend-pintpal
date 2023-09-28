class Beer < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews

  validates :name, :style, :abv, :description, :image_url, presence: true
  validates :description, length: { minimum: 5 }

  validates :abv, numericality: { greater_than_or_equal_to: 0 }

  validates :image_url, format: {
    with: URI.regexp, # This uses a regular expression to validate URL format
    message: "should be a valid URL"
  }

  validates :name, uniqueness: true 
end