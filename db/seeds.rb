require 'faker'

User.create(
    name: 'Test User',
    email: 'test@gail.com',
    password: 'password'
)

50.times do |n|
   User.create(
       name: Faker::Name.name,
       email: Faker::Internet.unique.email,
       password: 'password'
   ) 
end

users = User.order(:created_at).take(10)

50.times do
    content = Faker::JapaneseMedia::OnePiece.quote
    users.each { |user| user.posts.create(content: content)}
end

user = User.all
user = users.first
following = users[2..46]
followers = users[3..40]
following.each { |followed| user.follow(followed)}
followers.each { |follower| follower.follow(user)}