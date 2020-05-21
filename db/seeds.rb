require 'faker'
# require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

LOCATIONS = ['Tel Aviv', 'London', 'Amsterdam', 'Berlin', 'Paris']
puts 'adding seed data'


#   BIKE_PHOTOS = {
#   'BMX Bike': URI.open('https://i1.adis.ws/i/washford/143184/X-Rated-Exile-BMX--Bike---24-Wheel.webp?$sfcc_tile$&w=456'),
#   'City Bike': URI.open('https://cdn.webshopapp.com/shops/212063/files/126309038/6ku-odessa-8spd-city-bike-pershing-gold.jpg'),
#   'Electric Bike': URI.open('https://img.gkbcdn.com/s3/p/2019-10-23/onebot-s6-folding-electric-bike-250w-motor-max-25km-h-orange-1574132777187.jpg')
# }


BIKES = [
  {
    name: Faker::FunnyName.name,
    size: 'S',
    color: 'White',
    category: 'BMX Bike',
    equipment: 'Bike lock',
    location: LOCATIONS.sample,
    price: rand(5..15)
  },
  {
    name: Faker::FunnyName.name,
    size: 'M',
    color: 'orange',
    category: 'Electric Bike',
    equipment: 'Bike lock',
    location: LOCATIONS.sample,
    price: rand(5..15)
  },
  {
    name: Faker::FunnyName.name,
    size: 'xs',
    color: 'pastel blue',
    category: 'City Bike',
    equipment: 'Bike lock',
    location: LOCATIONS.sample,
    price: rand(5..15)
  }
]

  # BIKES = BIKES.map do |bike|
  #   new_bike = Bike.new(bike)
  #   new_bike.photos.attach(io:BIKE_PHOTOS[bike[:category]], filename: "bike#{i}.png", content_type: 'image/png')
  # end

10.times do |i|
  email = Faker::Internet.email
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  new_user = User.new(email: email, password:'123456', first_name: first_name, last_name: last_name)
  new_user.save!

  bike_sample = BIKES.sample
  bike_sample[:user] = new_user
  new_bike = Bike.new(bike_sample)
  new_bike.save
end

all_bikes = Bike.all

10.times do
  new_rental = Rental.new(user: all_bikes.sample.user, bike: all_bikes.sample, date: '2020-08-08')
  new_rental.save!
end

presenter = User.new(email: 'ran@bob.bob', password: '123456', first_name: 'Ran', last_name: 'Cohen')
puts 'Done.'

# #BIKE_CATEGORIES
# #bikes to different users
# #category should match bike img
# #create rental for each user
