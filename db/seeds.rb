# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.where(email: "test1@example.com").first_or_create(password: "password", password_confirmation: "password")

user2 = User.where(email: "test2@example.com").first_or_create(password: "password", password_confirmation: "password")

beer1 = Beer.create(
  name: "Modelo Especial",
  style: "Pilsner-style Lager",
  abv: 4.4,
  description: "An orange blossom honey aroma with a hint of herb.",
  image_url: "https://www.modelousa.com/cdn/shop/files/Especial-02_0_1024x1024.jpg?v=1638951577"
)

beer2 = Beer.create(
  name: "Dos Equis Lager Especial",
  style: "Golden Pilsner-style",
  abv: 4.2,
  description: "Balanced composition and a smooth, clean finish, it’s the party guest who is always invited and never overstays his welcome.",
  image_url: "https://dosequis.com/wp-content/uploads/dos-equis-lager-especial-001-1.jpgg"
)

review1 = [
  {
  city: "Dallas",
  state: "TX",
  review_text: "Awwww lawwwd",
  rating: 5,
  user_id: 1,
  beer_id: beer1.id
},
{
  city: "Colorado Springs",
  state: "CO",
  review_text: "One of my favs.",
  rating: 3,
  user_id: 2,
  beer_id: beer1.id
}
]


review2 = [
  {
  city: "Colorado Springs",
  state: "CO",
  review_text: "Tasty",
  rating: 4,
  user_id: 2,
  beer_id: beer2.id
},
{
  city: "Dallas",
  state: "TX",
  review_text: "I've had better",
  rating: 1,
  user_id: 1,
  beer_id: beer2.id
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