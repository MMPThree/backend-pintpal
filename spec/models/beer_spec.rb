require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "is not valid without a name" do 
  beer = Beer.create(
    style: "Pilsner-style Lager",
    abv: 4.4,
    description: "An orange blossom honey aroma with a hint of herb.",
    image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
  )
  expect(beer.errors[:name]).to_not be_empty 
  end

  it "is not valid without a style" do 
    beer = Beer.create(
      name: "Modelo Especial",
      abv: 4.4,
      description: "An orange blossom honey aroma with a hint of herb.",
      image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
    )
    expect(beer.errors[:style]).to_not be_empty 
    end

    it "is not valid without an abv" do 
      beer = Beer.create(
        name: "Modelo Especial",
        style: "Pilsner-style Lager",
        description: "An orange blossom honey aroma with a hint of herb.",
        image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
      )
      expect(beer.errors[:abv]).to_not be_empty 
      end

      it "is not valid without an description" do 
        beer = Beer.create(
          name: "Modelo Especial",
          style: "Pilsner-style Lager",
          abv: 4.4,
          image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
        )
        expect(beer.errors[:description]).to_not be_empty 
        end

        it "is not valid without an image_url" do 
          beer = Beer.create(
            name: "Modelo Especial",
            style: "Pilsner-style Lager",
            abv: 4.4,
            description: "An orange blossom honey aroma with a hint of herb.",
          )
          expect(beer.errors[:image_url]).to_not be_empty 
          end

          it "should validate description to be at least 5 characters" do
            beer = Beer.create(
            name: "Modelo Especial",
            style: "Pilsner-style Lager",
            abv: 4.4,
            description: "good",
            image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
            )
            expect(beer.errors[:description]).to include("is too short (minimum is 5 characters)")
          end
          it "is valid with all required attributes" do
            beer = Beer.create(
              name: "Modelo Especial",
              style: "Pilsner-style Lager",
              abv: 4.4,
              description: "An orange blossom honey aroma with a hint of herb.",
              image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
            )
            expect(beer).to be_valid
          end
          it "validates uniqueness of name" do
            existing_beer = Beer.create(
              name: "Modelo Especial",
              style: "Pilsner-style Lager",
              abv: 4.4,
              description: "An orange blossom honey aroma with a hint of herb.",
              image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
            )
            new_beer = Beer.new(
              name: "Modelo Especial",
              style: "Different Style",
              abv: 5.0,
              description: "Another description.",
              image_url: "https://example.com/image.jpg"
            )
            expect(new_beer).not_to be_valid
          end
          it "validates abv is within a valid range" do
            valid_beer = Beer.new(
              name: "Modelo Especial",
              style: "Pilsner-style Lager",
              abv: 4.4,
              description: "An orange blossom honey aroma with a hint of herb.",
              image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
            )
            invalid_beer = Beer.new(
              name: "Invalid Beer",
              style: "Invalid Style",
              abv: -1.0, # Invalid ABV
              description: "Invalid description.",
              image_url: "https://example.com/image.jpg"
            )
            expect(valid_beer).to be_valid
            expect(invalid_beer).not_to be_valid
          end
          it "validates image_url format" do
            valid_beer = Beer.new(
              name: "Modelo Especial",
              style: "Pilsner-style Lager",
              abv: 4.4,
              description: "An orange blossom honey aroma with a hint of herb.",
              image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
            )
            invalid_beer = Beer.new(
              name: "Invalid Beer",
              style: "Invalid Style",
              abv: 5.0,
              description: "Invalid description.",
              image_url: "not_a_url" # Invalid URL format
            )
            expect(valid_beer).to be_valid
            expect(invalid_beer).not_to be_valid
          end
          
end
