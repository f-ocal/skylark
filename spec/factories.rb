require 'faker'

def date
 "2016-" + rand(1..12).to_s + "-" + rand(1..28).to_s
end

FactoryGirl.define do
  factory :image do
    tileset_name { Faker::App.name }
    date_taken { date }
    description { Faker::Lorem.paragraph }
    camera_type { "DLSR" }
  end

  factory :user do
    username { Faker::App.author }
    email { Faker::Internet.email }
    password { '12345678' }
  end
end
