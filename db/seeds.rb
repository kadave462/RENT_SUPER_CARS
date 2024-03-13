# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# create users
Car.destroy_all
User.destroy_all

u1 = User.new(
  username: "admin",
  email: 'admin@email.com',
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city: Faker::Address.city,
  password: "passAdmin"
)
u1.save!

u2 = User.new(
  username: Faker::Internet.username,
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city: Faker::Address.city,
  password: "123456"
)
u2.save!

u3 = User.new(
  username: Faker::Internet.username,
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city: Faker::Address.city,
  password: "123456"
)
u3.save!

u4 = User.new(
  username: Faker::Internet.username,
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city: Faker::Address.city,
  password: "123456"
)
u4.save

u5 = User.new(
  username: Faker::Internet.username,
  email: Faker::Internet.email,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  city: Faker::Address.city,
  password: "123456"
)
u5.save

# create cars
30.times do
  user = [u1, u2, u3, u4, u5].sample
  car_brand = Faker::Vehicle.make
  price = (100..500).to_a
  horse_power = (200...800).to_a
  car = Car.new(
    car_model: Faker::Vehicle.model(make_of_model: car_brand),
    car_brand: car_brand.to_s,
    price: price.sample,
    horse_power: horse_power.sample,
    user_id: user.id
  )
  car.save!
end
