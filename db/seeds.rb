puts "cleaning the db"

Booking.delete_all
Parking.delete_all
User.delete_all

puts "building the new seed"

serge = User.create(email: 'serge@lewagon.org', password: 'wagonwagon')
esteban = User.create(email: 'esteban@lewagon.org', password: 'wagonwagon')
claire = User.create(email: 'claire@lewagon.org', password: 'wagonwagon')
camille = User.create(email: 'camille@lewagon.org', password: 'wagonwagon')

Parking.create(
  user_id: serge.id,
  address: '5333, avenue Casgrain, H2T 1X3, Montréal',
  description: "close to the bus station, quiet hood.",
  city: 'Montréal',
  start_time: Time.now,
  finish_time: Time.now + 10,
  price: 54,
  remote_photo_url: "http://bit.ly/2Q1hJZW"
)

Parking.create(
  user_id: esteban.id,
  address: 'calle Manipa, 87, 28027 Madrid',
  description: "residential parking with video surveillance, super quiet.",
  city: 'Madrid',
  start_time: Time.now,
  finish_time: Time.now + 10,
  price: 42,
  remote_photo_url: "http://bit.ly/2Q2iPoc"
)

Parking.create(
  user_id: claire.id,
  address: '56 Wharf Rd, Hoxton, London, N1 7EW',
  description: "close to the metro, underground parking.",
  city: 'London',
  start_time: Time.now,
  finish_time: Time.now + 10,
  price: 95,
  remote_photo_url: "http://seloc-am.org/cms-files/56e6/56e69343332a2.jpg"
)

Parking.create(
  user_id: camille.id,
  address: '15, rue du lycée, 64200 Biarritz',
  description: "super quiet, big parking spot, super easy to park.",
  city: 'Biarritz',
  start_time: Time.now,
  finish_time: Time.now + 10,
  price: 37,
  remote_photo_url: "https://cdn.vox-cdn.com/thumbor/XPpD9_FRhv02FWwxbvnKxcZesUc=/0x0:3600x2400/1200x800/filters:focal(1512x912:2088x1488)/cdn.vox-cdn.com/uploads/chorus_image/image/58321331/shutterstock_36463816.0.jpg"
)

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
