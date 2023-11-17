# require 'rails_helper'

# RSpec.describe 'Posts', type: :feature do
#   before :all do
#     Like.delete_all
#     Comment.delete_all
#     Post.delete_all
#     User.delete_all

#     @fu = User.created(name: 'User one', photo: 'link', bio: 'User one Bio.')
#     @su = User.created(name: 'User two', photo: 'link', bio: 'User two Bio.')

#     3.times { |i| Post.create(author: @fu, title: "Post #{i + 1}", text: "First author Post #{i + 1} body") }
#     5.times { |i| Post.create(author: @su, title: "Post #{i + 1}", text: "Second author Post #{i + 1} body") }

#     6.times { |i| Comment.create(post: @fu.posts.first, user: @fu, text: "Comment #{i + 1}") }
#     3.times { |i| Comment.create(post: @su.posts.first, user: @su, text: "Comment #{i + 1}") }

#     6.times { Like.create(post: @fu.posts.first, user: @fu) }
#   end

#   describe 'show page' do
#     it 'should direct to posts show' do
#       visit users_path
#       click_link(@fu.name)
#       click_link(@fu.posts.last.title)
#       sleep(1)
#       expect(current_path).to eq(user_post_path(@fu, @fu.posts.last))
#       visit users_path
#       click_link(@su.name)
#       click_link(@su.posts[3].title)
#       sleep(1)
#       expect(current_path).to eq(user_post_path(@su, @su.posts[3]))
#     end

#     it 'should render post title' do
#       visit user_post_path(@fu, @fu.posts.first)
#       expect(page).to have_content('Post 1')
#       visit user_post_path(@fu, @fu.posts.second)
#       expect(page).to have_content('Post 2')
#       visit user_post_path(@su, @su.posts.last)
#       expect(page).to have_content('Post 1')
#     end
#   end
# end


# require 'spec_helper'
# ENV['RAILS_ENV'] ||= 'test'
# require_relative '../config/environment'
# abort('The Rails environment is running in production mode!') if Rails.env.production?
# require 'rspec/rails'
# begin
#   ActiveRecord::Migration.maintain_test_schema!
# rescue ActiveRecord::PendingMigrationError => e
#   abort e.to_s.strip
# end
# RSpec.configure do |config|
#   config.fixture_path = "#{Rails.root}/spec/fixtures"
#   config.use_transactional_fixtures = true

#   config.infer_spec_type_from_file_location!

#   config.filter_rails_from_backtrace!
# end

# Graciano Henrique  to  Everyone 4:17 PM
# require 'rails_helper'

# RSpec.describe 'Index', type: :feature do

# it "sum" do
# end
# require 'rails_helper'

# RSpec.describe 'Index', type: :feature do

# it "sum" do
# expect(1+1).to be 2
# end

require 'rails_helper'

RSpec.describe 'Index', type: :feature do

it "sum" do
expect(1+1).to be 2
end
end