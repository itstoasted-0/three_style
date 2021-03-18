#users
User.create!(name:  "くぼ レオ",
            email: "sample@example.com",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: true)

99.times do |n|
 name  = Faker::Name.name
 email = "sample-#{n+1}@example.com"
 password = "password"
 User.create!(name:  name,
              email: email,
              password: password,
              password_confirmation: password)
end

#posts
10.times do |n|
  content  = Faker::Lorem.sentence
  Post.create!(genre: 0,
               content: content,
               user_id: 1)
end

#relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }