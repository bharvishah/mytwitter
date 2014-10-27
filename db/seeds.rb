# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  messages = 10.times.map { Faker::Lorem.sentence(4) }
  User.create_user_with_messages Faker::Internet.user_name(separators = %w(. _)), Faker::Internet.password(4), messages
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
followers.each { |follower| user.followings.create follower: follower }
following.each { |followed| followed.followings.create follower: user }
