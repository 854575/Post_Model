# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 4주차까지의 샘플데이터
# make group
young_group = Group.create(name: "young")
old_group = Group.create(name: "old")

# Young user
for i in 1..5
  User.create(name: Faker::Name.name, age: rand(20...40), mail: Faker::Internet.email)
end
# old User
for i in 6..10
  User.create(name: Faker::Name.name, age: rand(40...60), mail: Faker::Internet.email)
end

# include user into group
young_id = young_group.id
old_id = old_group.id
User.all.each do |user|
  if user.age >= 40
    Usergroup.create(user_id: user.id, group_id: old_id)
  else
    Usergroup.create(user_id: user.id, group_id: young_id)
  end
end

# write one post
User.find(5).posts.create(title: Faker::Book.title, content: Faker::Zelda.game)

# Young user do likes
mypost = Post.all.take
young_group.user_groups.each do |user_group|
  mypost.likes.create(user_id: user_group.user_id)
end
# old user writes comments
mypost = Post.all.take
old_group.user_groups.each do |user_group|
  mypost.comments.create(user_id: user_group.user_id, content: Faker::Zelda.game)
end