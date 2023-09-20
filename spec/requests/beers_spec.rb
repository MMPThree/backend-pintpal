require 'rails_helper'

RSpec.describe "Beers", type: :request do
  describe "GET /index" do
    it "gets a list of beers" do
      Beer.create(
        name: "Modelo Especial",
        style: "Pilsner-style Lager",
        abv: 4.4,
        description: "An orange blossom honey aroma with a hint of herb.",
        image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
      )

      get '/beers'
      beer = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(beer.length).to eq 1
    end
  end

  describe "GET /show/:id" do
    it "shows a single beer" do
      beer1 = Beer.create(
        name: "Modelo Especial",
        style: "Pilsner-style Lager",
        abv: 4.4,
        description: "An orange blossom honey aroma with a hint of herb.",
        image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
      )

      get "beers/#{beer1.id}"
      expect(response).to have_http_status(200)
    end
  end

end
