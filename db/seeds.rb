# db/seeds.rb

# Create users
user1 = User.create(name: 'John Doe', photo: 'john.jpg', bio: 'Web Developer', post_counter: 0)
user2 = User.create(name: 'Jane Smith', photo: 'jane.jpg', bio: 'Designer', post_counter: 0)

# Create posts for each user
post1 = user1.posts.create(title: 'First Post by John', text: 'This is the content of the first post by John.')
post2 = user1.posts.create(title: 'Second Post by John', text: 'Another post by John.')

post3 = user2.posts.create(title: 'First Post by Jane', text: 'This is the content of the first post by Jane.')

# Create comments on posts
Comment.create(text: 'Great post!', user: user2, post: post1)
Comment.create(text: 'Interesting thoughts.', user: user1, post: post3)

# Create likes on posts
Like.create(user: user1, post: post2)
Like.create(user: user2, post: post3)

puts 'Seed data has been created!'
