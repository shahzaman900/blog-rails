require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before :all do
    Like.delete_all
    Comment.delete_all
    Post.delete_all
    User.delete_all

    @fu = User.create(name: 'User one', photo: 'link', bio: 'User one Bio.')
    @su = User.create(name: 'User two', photo: 'link', bio: 'User two Bio.')

    3.times { |i| Post.create(author: @fu, title: "Post #{i + 1}", text: "First author Post #{i + 1} body") }
    5.times { |i| Post.create(author: @su, title: "Post #{i + 1}", text: "Second author Post #{i + 1} body") }

    6.times { |i| Comment.create(post: @fu.posts.first, user: @fu, text: "Comment #{i + 1}") }
    3.times { |i| Comment.create(post: @su.posts.first, user: @su, text: "Comment #{i + 1}") }

    6.times { Like.create(post: @fu.posts.first, user: @fu) }
  end

  describe 'index page' do
    it 'should direct to posts index' do
      visit users_path
      click_link(@fu.name)
      click_link(@fu.posts.last.title)
      sleep(1)
      expect(current_path).to eq(user_post_path(@fu, @fu.posts.last))
      visit users_path
      click_link(@su.name)
      click_link(@su.posts[3].title)
      sleep(1)
      expect(current_path).to eq(user_post_path(@su, @su.posts[3]))
    end

    it 'should render user names' do
      visit users_path
      click_link(@fu.name)
      click_link('See all posts')
      sleep(1)
      expect(page).to have_content(@fu.name)
      visit user_posts_path(@su)
      click_link(@su.name)
      click_link('See all posts')
      sleep(1)
      expect(page).to have_content('User two')
    end

    it 'should render user photos' do
      visit users_path
      click_link(@fu.name)
      click_link('See all posts')
      sleep(1)
      expect(page).to have_css('img.user-img')
      visit user_posts_path(@su)
      sleep(1)
      expect(page).to have_css('img.user-img')
    end

    it 'should render the number of posts' do
      visit user_posts_path(@fu)
      expect(page).to have_content("Number of posts: #{@fu.posts_counter}")
      visit user_posts_path(@su)
      expect(page).to have_content('Number of posts: 5')
    end

    it 'should render the posts of users' do
      visit user_posts_path(@fu)
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Post 2')
      visit user_posts_path(@su)
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Post 2')
    end

    it 'should render posts body' do
      visit user_posts_path(@fu)
      expect(page).to have_content('First author Post 1 body')
      expect(page).to have_content('First author Post 2 body')
      visit user_posts_path(@su)
      expect(page).to have_content('Second author Post 1 body')
      expect(page).to have_content('Second author Post 2 body')
    end

    it 'should render number of comments' do
      visit user_posts_path(@fu)
      expect(page).to have_content('Comments: 6')
      expect(page).to have_content('Comments: 0')
      visit user_posts_path(@su)
      expect(page).to have_content('Comments: 3')
      expect(page).to have_content('Comments: 0')
    end

    it 'should render comments' do
      visit user_posts_path(@fu)
      expect(page).to have_content('@User one: Comment 6')
      expect(page).to have_content('No Comments found!')
      visit user_posts_path(@su)
      expect(page).to have_content('@User two: Comment 3')
      expect(page).to have_content('No Comments found!')
    end

    it 'should render number of likes' do
      visit user_posts_path(@fu)
      expect(page).to have_content('Likes: 6')
      expect(page).to have_content('Likes: 0')
      visit user_posts_path(@su)
      expect(page).to have_content('Likes: 0')
    end

    it 'should render pagination' do
      visit "/users/#{@fu.id}/posts?page=1"
      sleep(1)
      expect(page).to have_link('2', href: "/users/#{@fu.id}/posts?page=2")
    end
  end

  describe 'Each post routings' do
    it 'should redirect to first user posts' do
      visit users_path
      click_link(@fu.name)
      click_link(@fu.posts.last.title)
      sleep(1)
      expect(current_path).to eq(user_post_path(@fu, @fu.posts.last))
    end
  end
end