# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# user = User.create(
#   name: 'Shah Zaman',
#   photo: 'https://picsum.photos/200',
#   bio: 'dbflaskjdbfasdbfalsdbfasdblf',
#   post_counter: 10
# )

# 20.times do |i|
#   User.create(
#     name: "Shah Zaman #{i+1}",
#   photo: 'https://picsum.photos/200',
#   bio: 'dbflaskjdbfasdbfalsdbfasdblf',
#   post_counter: 10
#   )
# end


5.times do |i|
  Post.create(
    title: "Post #{i+1}",
    text: 'Lorem Ipsum is simply dummy text of the printing and typesetting',
    comments_counter: 2,
  )
end
