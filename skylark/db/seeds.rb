# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

user = User.new(
  username: 'Steve',
  email: 'steve@email.com',
  password: '12345678')
user.save

user2 = User.new(
  username: 'Amy',
  email: 'amy@email.com',
  password: '12345678')
user2.save

5.times do
  date = "2016-" + rand(1..12).to_s + "-" + rand(1..28).to_s
  Image.create(
    user_id: 1,
    title: Faker::Hacker.adjective + Faker::Hacker.noun,
    tileset: "whoosawhatsits2245624gfg",
    date_taken: date,
    description: Faker::Lorem.paragraph,
    camera_type: Faker::Hacker.abbreviation
    )
end

5.times do
  date = "2016-" + rand(1..12).to_s + "-" + rand(1..28).to_s
  Image.create(
    user_id: 2,
    title: Faker::Hacker.adjective + Faker::Hacker.noun,
    tileset: "whargabrlefrabblebab54624",
    date_taken: date,
    description: Faker::Lorem.paragraph,
    camera_type: Faker::Hacker.abbreviation
    )
end
