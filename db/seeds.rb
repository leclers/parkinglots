puts "cleaning the db"

Booking.delete_all
Parking.delete_all
User.delete_all

puts "building the new seed..."

serge = User.create(email: 'serge@lewagon.org', password: 'wagonwagon')
esteban = User.create(email: 'esteban@lewagon.org', password: 'wagonwagon')
claire = User.create(email: 'claire@lewagon.org', password: 'wagonwagon')
camille = User.create(email: 'camille@lewagon.org', password: 'wagonwagon')

Parking.create(
  user_id: serge.id,
  address: '5333, avenue Casgrain, H2T 1X3, Montréal',
  description: "close to the bus station, quiet hood.",
  city: 'Montréal',
  start_time: Time.new(2018, 11, 8),
  finish_time: Time.new(2018, 12, 1),
  price: 54,
  remote_photo_url: "http://bit.ly/2Q1hJZW"
)

Parking.create(
  user_id: esteban.id,
  address: 'calle de Manipa, 87, 28027 Madrid, Spain',
  description: "residential parking with video surveillance, super quiet.",
  city: 'Madrid',
  start_time: Time.new(2018, 10, 10),
  finish_time: Time.new(2018, 11, 21),
  price: 42,
  remote_photo_url: "http://bit.ly/2Q2iPoc"
)

Parking.create(
  user_id: claire.id,
  address: '56 Wharf Rd, Hoxton, London, N1 7EW',
  description: "close to the metro, underground parking.",
  city: 'London',
  start_time: Time.new(2018, 11, 9),
  finish_time: Time.new(2018, 11, 12),
  price: 95,
  remote_photo_url: "https://i.ebayimg.com/00/s/NDMxWDEwMjQ=/z/S6sAAOSw~19bK2sK/$_86.JPG"
)

Parking.create(
  user_id: camille.id,
  address: '15, rue du lycée, 64200 Biarritz',
  description: "super quiet, big parking spot, super easy to park.",
  city: 'Biarritz',
  start_time: Time.new(2018, 9, 10),
  finish_time: Time.new(2018, 11, 23),
  price: 37,
  remote_photo_url: "https://cdn.vox-cdn.com/thumbor/XPpD9_FRhv02FWwxbvnKxcZesUc=/0x0:3600x2400/1200x800/filters:focal(1512x912:2088x1488)/cdn.vox-cdn.com/uploads/chorus_image/image/58321331/shutterstock_36463816.0.jpg"
)


puts "all finished, cool"
