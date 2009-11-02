require 'machinist/active_record'
require 'faker'
require 'sham'

Sham.name  { Faker::Name.name }
Sham.email { Faker::Internet.email }
Sham.title { Faker::Lorem.sentence }
Sham.body  { Faker::Lorem.paragraph }
Sham.content { Faker::Lorem.paragraph }
Sham.date { Time.now }
Sham.code { Faker::Lorem.words.first }
Sham.price { (1..100).to_a.rand }
Sham.password { Faker::Company.bs }

User.blueprint do
  name
  email
  password
end

Service.blueprint do
  name
end

Page.blueprint do
  title Sham.name
end

TopCity.blueprint do
  city "Dublin"
  country "IE"
end