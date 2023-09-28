require 'rails_helper'

RSpec.describe Review, type: :model do
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

       it "is not valid without a review" do
        review = user.reviews.create(
        username: 'beerlover',
        city: "Dallas",
        state: "TX",
        rating: 5,
        beer_id: beer.id, 
        user_id: user.id
      )
        expect(review.errors[:review_text]).to_not be_empty
       end
    
       it "is not valid without a city" do
        review = user.reviews.create(
        username: 'beerlover',
        review_text: "Awwww lawwwd",
        state: "TX",
        rating: 5,
        beer_id: beer.id, 
        user_id: user.id
      )
        expect(review.errors[:city]).to_not be_empty
       end

       it "is not valid without a state" do
        review = user.reviews.create(
        username: 'beerlover',
        review_text: "Awwww lawwwd",
        city: "Dallas",
        rating: 5,
        beer_id: beer.id, 
        user_id: user.id
      )
        expect(review.errors[:state]).to_not be_empty
       end

       it "is not valid without a rating" do
        review = user.reviews.create(
        username: 'beerlover',
        review_text: "Awwww lawwwd",
        city: "Dallas",
        state: "TX",
        beer_id: beer.id, 
        user_id: user.id
      )
        expect(review.errors[:rating]).to_not be_empty
       end

       it "is not valid without a beer_id" do
        review = user.reviews.create(
        username: 'beerlover',
        review_text: "Awwww lawwwd",
        city: "Dallas",
        state: "TX",
        rating: 5, 
        user_id: user.id
      )
        expect(review.errors[:beer_id]).to_not be_empty
       end

       it "is not valid without a username" do
        review = user.reviews.create(
        review_text: "Awwww lawwwd",
        city: "Dallas",
        state: "TX",
        rating: 5, 
        beer_id: beer.id,
        user_id: user.id
      )
        expect(review.errors[:username]).to_not be_empty
       end
       it "is valid with all required attributes" do
        review = user.reviews.create(
          username: 'beerlover',
          review_text: "Awwww lawwwd",
          city: "Dallas",
          state: "TX",
          rating: 5,
          beer_id: beer.id,
          user_id: user.id
        )
        expect(review).to be_valid
      end
      
end
