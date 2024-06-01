# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

100.times do |i|
	place = Place.create(
	name: Faker::Address.street_address,
	description: Faker::Lorem.paragraph,
	longitude: Faker::Address.longitude,
	latitude: Faker::Address.latitude, 
	state: Faker::Address.state,
	city: Faker::Address.city,
	country: Faker::Address.country
	)
	puts "Place #{i+1} create successfully"

	10.times do |i|
		place.images.create(url: 'https://chittore.jpg')
	end
end
