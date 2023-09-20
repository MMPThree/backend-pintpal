require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  let(:user){User.create(
   email: 'test1@example.com',
   password: 'password',
   password_confirmation: 'password'
  )} 

  describe "GET /index" do
    it 'gets review inputs' do
      review = user.reviews.create(
        city: "Dallas",
        state: "TX",
        review_text: "Awwww lawwwd",
        rating: 5,
        user_id: 1,
        beer_id: beer1.id
      )
      get '/reviews'
      review = JSON.parse(response.body)
      except(reponse).to have_http_status(200)
      expect(review.['city']).to eq("Dallas")
    end 
  end
end
