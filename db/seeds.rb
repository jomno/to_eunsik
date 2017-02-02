# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  user = User.new
  user.name = Faker::Name.name
  user.mail = Faker::Internet.email
  user.save
end

for n in 1..5
  user = User.find(n)
  user.age = rand(20..39)
  user.save
end

for n in 6..10
  user = User.find(n)
  user.age = rand(40..59)
  user.save
end

Group.create :name => "young Group"
Group.create :name => "old Group"

User.all.each do |a|
    if a.age<40
       GroupsUser.create(user_id: a.id, group_id: 1) #young 인지 old 인지 직관적으로 알 수 있게 수정할 필요가 있다.
     else
       GroupsUser.create(user_id: a.id, group_id: 2)
    end
end


Post.create([{user_id: 5, title: Faker::Lorem.word, content: Faker::Lorem.paragraph}])

Group.find(1).users.each do |u|
	Like.create(user_id: u.id, post_id: 1)
end

Group.find(2).users.each do |u|
	Comment.create(user_id: u.id, post_id: 1, content: Faker::Lorem.word)
end
