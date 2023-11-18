require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before :all do
    Like.delete_all
    Comment.delete_all
    Post.delete_all
    User.delete_all

    @fu = User.create(name: 'User one', photo: 'link', bio: 'User one Bio.')
    @su = User.create(name: 'User two', photo: 'link', bio: 'User two Bio.')

    3.times { |i| Post.create(author: @fu, title: "Post #{i + 1}") }
    5.times { |i| Post.create(author: @su, title: "Post #{i + 1}") }
  end

  describe 'show page' do
    it 'should direct to users show' do
      visit users_path
      click_link(@fu.name)
      sleep(1)
      expect(current_path).to eq(user_path(@fu))
      visit users_path
      click_link(@su.name)
      sleep(1)
      expect(current_path).to eq(user_path(@su))
    end

    it 'should render user names' do
      visit users_path
      click_link(@fu.name)
      expect(page).to have_content(@fu.name)
      visit users_path
      click_link(@su.name)
      expect(page).to have_content('User two')
    end

    it 'should render user photos' do
      visit users_path
      click_link(@fu.name)
      expect(page).to have_css('img.user-img')
      visit users_path
      click_link(@su.name)
      expect(page).to have_css('img.user-img')
    end

    it 'should render user bio' do
      visit user_path(@fu)
      expect(page).to have_content('User one Bio.')
      visit user_path(@su)
      expect(page).to have_content(@su.bio)
    end

    it 'should render see all posts button' do
      visit user_path(@fu)
      sleep(1)
      expect(page).to have_link('See all posts', href: user_posts_path(@fu))
    end

    it 'should render the number of posts' do
      visit users_path
      click_link(@fu.name)
      expect(page).to have_content("Number of posts: #{@fu.posts_counter}")
      visit users_path
      click_link(@su.name)
      expect(page).to have_content('Number of posts: 5')
    end

    it 'should render the posts of users' do
      visit user_path(@fu)
      sleep(1)
      expect(page).to have_content('Post 3')
      expect(page).to have_content('Post 2')
      expect(page).to have_content('Post 1')
      visit user_path(@su)
      sleep(1)
      expect(page).to have_content('Post 5')
      expect(page).to have_content('Post 4')
      expect(page).to have_content('Post 3')
    end
  end

  describe 'Each post routings' do
    it 'should redirect to first user posts' do
      visit users_path
      sleep(1)
      click_link(@fu.name)
      sleep(1)
      click_link(@fu.posts.last.title)
      sleep(1)
      expect(current_path).to eq(user_post_path(@fu, @fu.posts.last))
    end

    it 'should redirect to all posts' do
      visit users_path
      sleep(1)
      click_link(@su.name)
      sleep(1)
      click_link('See all posts')
      sleep(1)
      expect(current_path).to eq(user_posts_path(@su))
    end
  end
end