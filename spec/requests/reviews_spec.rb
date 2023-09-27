require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  let(:user){User.create(
   username: 'beerlover',
   email: 'test1@example.com',
   password: 'password',
   password_confirmation: 'password'
  )} 
  let(:beer){Beer.create(
    name: "Modelo Especial",
    style: "Pilsner-style Lager",
    abv: 4.4,
    description: "An orange blossom honey aroma with a hint of herb.",
    image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
  )}

  describe "GET /index" do
    it 'gets all review inputs' do
      review = user.reviews.create(
        city: "Dallas",
        state: "TX",
        review_text: "Awwww lawwwd",
        rating: 5,
        beer_id: beer.id,
        username: user.username
      )
      get '/reviews'
      reviews = JSON.parse(response.body)
      expect(reviews.length).to eq 1
      expect(response).to have_http_status(200)
      review = reviews.first
      expect(review['city']).to eq("Dallas")
      expect(review['state']).to eq("TX")
      expect(review['review_text']).to eq("Awwww lawwwd")
      expect(review['rating']).to eq(5)

    end 
  end

  describe "GET /show/:id" do
    it 'shows a single review' do
      review1 = Review.create(
        city: "Dallas",
        state: "TX",
        review_text: "Awwww lawwwd",
        rating: 5,
        beer_id: beer.id,
        username: user.username
      )
      get "/reviews/#{review1.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "creates a review" do
      review_params = {
        review: {
          city: "Dallas",
          state: "TX",
          review_text: "Awwww lawwwd",
          rating: 5,
          beer_id: beer.id,
          user_id: user.id,
          username: user.username
        }
      }
      post "/reviews", params: review_params
      JSON.parse(response.body)
      review = Review.first 
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH /update" do
    it "it updates a review" do
      review_params = {
        review: {
          city: "Dallas",
          state: "TX",
          review_text: "Awwww lawwwd",
          rating: 5,
          beer_id: beer.id,
          user_id: user.id,
          username: user.username
        }
      }
      post "/reviews", params: review_params

      review = Review.first 
      update_review_params = {
        review: {
          city: "Dallas",
          state: "TX",
          review_text: "Awwww lawwwd",
          rating: 5,
          beer_id: beer.id,
          user_id: user.id,
          username: user.username 
        }
      }

      patch "/reviews/#{review.id}", params:
      update_review_params
      updated_review = Review.find(review.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /destroy" do
    it "it deletes a review" do
      review_params = {
        review: {
          city: "Dallas",
          state: "TX",
          review_text: "Awwww lawwwd",
          rating: 5,
          beer_id: beer.id,
          user_id: user.id,
          username: user.username
        }
      }

      post '/reviews', params: review_params
      review = Review.first
      delete "/reviews/#{review.id}"
      expect(response).to have_http_status(200)
      reviews = Review.all
      expect(reviews).to be_empty 
    end
  end

end
