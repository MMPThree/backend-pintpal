# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'


user1 = User.where(email: "test1@example.com", username: "beerlover").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "test2@example.com", username: "brewlover").first_or_create(password: "password", password_confirmation: "password")

beer_objects = {}

CSV.foreach(Rails.root.join('lib/seed_csv/beer-list.csv'), headers: true) do |row|
    Beer.create( {
    name: row["name"], 
    style: row["style"],
    abv: row["abv"], 
    description: row["description"],
    image_url: row["image_url"]
  } 
)   
end
# beer1 = Beer.create(
#   name: "Modelo Especial",
#   style: "Pilsner-style Lager",
#   abv: 4.4,
#   description: "An orange blossom honey aroma with a hint of herb.",
#   image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
# )

# beer2 = Beer.create(
#   name: "Dos Equis Lager Especial",
#   style: "Golden Pilsner-style",
#   abv: 4.2,
#   description: "Balanced composition and a smooth, clean finish, it’s the party guest who is always invited and never overstays his welcome.",
#   image_url: "https://static.specsonline.com/wp-content/uploads/2022/11/007231163012-1.jpg"
# )

review1 = [
  {
  username: user1.username,
  city: "Dallas",
  state: "TX",
  review_text: "Look...copper but closer to gold with a quickly dissolving white head. completely clear
  Smell...the lightest of hints of the hop citrus and wheat. A wave of fresh grass
  Taste...reminiscent to me of a German pils but a little bit maltier and not as dry on the finish. A pillow like resolve at the end with some sweetness.
  Feel..Smooth and thin with a proper amount of carbonation giving an easy drinking
  Overall...I would not buy this too many times a year but I don't buy many non craft pilsners at all soo...It is great on a hot day and some good eats . great vacation beer or staycation . I gotta be honest these are cooler dwellers from vaca....so gifted cheers",
  rating: 3,
  user_id: 1,
  beer_id: Beer.find_by(name: "Modelo Especial")&.id
},
{
  username: user1.username,
  city: "Dallas",
  state: "TX",
  review_text: "I've had better",
  rating: 1,
  user_id: 1,
  beer_id: Beer.find_by(name: "Dos Equis Lager Especial")&.id
}
]


review2 = [
  {
  username: user2.username,
  city: "Colorado Springs",
  state: "CO",
  review_text: "12 oz can (I don't drink from green beer bottles). Better than I thought it would be, not as good as I hoped it would be. Pretty balanced overall - not too bitter or sweet, just the right amount of bubbles. Definitely one of the better adjuncts. High end lawn mower beer. It'll definitely do when icy cold!",
  rating: 4,
  user_id: 2,
  beer_id: Beer.find_by(name: "Dos Equis Lager Especial")&.id
},
{
  username: user2.username,
  city: "Colorado Springs",
  state: "CO",
  review_text: "This is the best beer you can buy at 7-Eleven. It has a decent amber color, and it tastes good. Like Beer. It's fairly smooth, without an unpleasant aftertaste. It's a step above your average adjunct lager. When I'm tired of the heaviness of stouts, and the bitterness of IPAs, I enjoy a glass of this beer. It reminds me of when I was young, having a beer with my dad, or drinking with my friends.",
  rating: 4,
  user_id: 2,
  beer_id: Beer.find_by(name: "Modelo Especial")&.id
}
]

review1.each do |each_review|
  user1.reviews.create(each_review)
  p "created: #{each_review}"
end

review2.each do |each_review|
  user2.reviews.create(each_review)
  p "created: #{each_review}"
end