# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning the db"

Booking.delete_all
Parking.delete_all
User.delete_all

puts "building the new seed"

8.times do
  User.create( {
    email: Faker::Internet.email,
    password: Faker::Internet.password(10)
  })
end


User.all.each do |user|
  3.times do
    Parking.create({
    user_id: user.id,
    address: Faker::Address.street_address,
    city: Faker::HarryPotter.location,
    zip_code: Faker::Address.zip_code,
    start_time: Faker::Time.between(DateTime.now - 10, DateTime.now + 10),
    finish_time: Faker::Time.between(DateTime.now, DateTime.now + 10)
  })
  end
end

users = User.all
parkings = Parking.all


4.times do
  Booking.new({
    user_id: users.sample(1)[0].id,
    parking_id: parkings.sample(1)[0].id,
    start_time: Faker::Time.between(DateTime.now - 10, DateTime.now + 10),
    finish_time: Faker::Time.between(DateTime.now, DateTime.now + 10)
  })
end

puts "all finished, cool"
