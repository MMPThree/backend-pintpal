class Beer < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews
  validates :name, :style, :abv, :description, :image_url, presence: true
  validates :description, length: {minimum: 5}
end
