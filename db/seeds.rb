# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Tweet.destroy_all

password = "abcd1234"

5.times do
  user = User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: password)

  3.times do
  	user.tweets.create(message: Faker::Lorem.characters(140))
  end
end