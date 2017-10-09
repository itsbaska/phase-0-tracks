require 'faker'

User.destroy_all
Restaurant.destroy_all
Review.destroy_all

20.times do
  temp_user = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    email: Faker::Internet.safe_email,
    password: "123456"
  }
  User.create!(temp_user)
end

20.times do
  temp_restaurant = {
    name: Faker::Food.spice,
    location: "#{Faker::Address.street_address}, #{Faker::Address.city} #{Faker::Address.zip_code}",
    cuisine_type: Faker::Address.country,
    user_id: rand(1..20)
  }
  Restaurant.create!(temp_restaurant)
end

100.times do
  temp_review = {
    body: Faker::Hipster.paragraph,
    restaurant_id: rand(1..20),
    user_id: rand(1..20)
  }
  Review.create!(temp_review)
end
