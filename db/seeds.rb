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

serge = User.create(email: 'serge@lewagon.org', password: 'wagonwagon')
esteban = User.create(email: 'esteban@lewagon.org', password: 'wagonwagon')
claire = User.create(email: 'claire@lewagon.org', password: 'wagonwagon')
camille = User.create(email: 'camille@lewagon.org', password: 'wagonwagon')


# 8.times do
#   User.create( {
#     email: Faker::Internet.email,
#     password: Faker::Internet.password(10)
#   })
# end

Parking.create(
  user_id: serge.id,
  address: '5333, avenue Casgrain, H2T 1X3, Montréal',
  description: "close to the bus station, quiet 'hood.",
  city: 'Montréal',
  start_time: Time.now,
  finish_time: Time.now + 10,
  price: 54,
  photo: "http://bit.ly/2Q1hJZW"
)

Parking.create(
  user_id: esteban.id,
  address: 'calle Manipa, 87, 28027 Madrid',
  description: "residential parking with video surveillance, super quiet.",
  city: 'Madrid',
  start_time: Time.now,
  finish_time: Time.now + 10,
  price: 42,
  photo: "http://bit.ly/2Q2iPoc"
)

Parking.create(
  user_id: claire.id,
  address: '56 Wharf Rd, Hoxton, London, N1 7EW',
  description: "close to the metro, underground parking.",
  city: 'London',
  start_time: Time.now,
  finish_time: Time.now + 10,
  price: 95,
  photo: "http://bit.ly/2Q5XXwF"
)

Parking.create(
  user_id: camille.id,
  address: '15, rue du lycée, 64200 Biarritz',
  description: "super quiet, big parking spot, super easy to park.",
  city: 'Biarritz',
  start_time: Time.now,
  finish_time: Time.now + 10,
  price: 37,
  photo: "http://bit.ly/2PVqVPC"
)



# User.all.each do |user|
#   2.times do
#     Parking.create({
#     user_id: user.id,
#     address: Faker::Address.street_address,
#     city: Faker::HarryPotter.location,
#     zip_code: Faker::Address.zip_code,
#     start_time: Faker::Time.between(DateTime.now - 10, DateTime.now + 10),
#     finish_time: Faker::Time.between(DateTime.now, DateTime.now + 10),
#     photo: Faker::Placeholdit.image, #=> "http://placehold.it/300x300.png/000"
#     description: Faker::HarryPotter.quote
#   })
#   end
# end

users = User.all
parkings = Parking.all

4.times do
  Booking.create({
    user_id: users.sample(1)[0].id,
    parking_id: parkings.sample(1)[0].id,
    start_time: Time.now + Random.new.rand(10),
    finish_time: Time.now + Random.new.rand(20),
  })
end



puts "all finished, cool"
