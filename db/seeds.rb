# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
cities = ["New-York", "Washington", "Atlanta", "Las Vegas", "San Diego"]

Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
City.destroy_all

(0..4).each do |index|
  city = City.create(city_name: cities[index])
  puts "La ville de #{city.city_name} a été générée"
end

100.times do
  dog = Dog.create!(name: Faker::Creature::Dog.name, city_id: rand(1..5))
end
puts "100 dogs ont été générés !"
puts "Par exemple, le premier dog s'appelle #{Dog.first.name} et le dernier #{Dog.last.name}."

50.times do
  dogsitter = Dogsitter.create!(name: Faker::Name.first_name, city_id: rand(1..5))
end
puts "50 dogsitters ont été générés !"

200.times do
  rand_dog = Dog.find(rand(1...101))
  dog_city_id = rand_dog.city_id
  stroll = Stroll.create!(dog: rand_dog, dogsitter: Dogsitter.where(city_id: dog_city_id).sample, date: Time.at(rand * Time.now.to_i), city_id: dog_city_id)
end

puts "200 strolls ont été générés !"
