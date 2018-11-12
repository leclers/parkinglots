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
    address: Faker::Address.full_address,
    start_time: Faker::Time.between(DateTime.now - 10, DateTime.now + 10),
    finish_time: Faker::Time.between(DateTime.now, DateTime.now + 10)
  })
  end
end

puts "all finished, cool"
