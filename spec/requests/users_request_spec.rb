require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before :each do
      get users_path
    end

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'returns http status 200' do
      expect(response.status).to eq(200)
    end

    it 'should render index template' do
      expect(response).to render_template(:index)
    end

    it 'should render placeholder from index method' do
      expect(response.body).to include('Number of posts: ')
    end
  end

  describe 'GET /show' do
    before :all do
      valid_attributes = { name: 'Tan' }
      @user = User.create! valid_attributes
      get user_url(@user)
    end

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'returns http status 200' do
      expect(response.status).to eq(200)
    end

    it 'should render show template' do
      get user_url(@user)
      expect(response).to render_template(:show)
    end

    it 'should render placeholder from show method' do
      expect(response.body).to include('Number of posts: ')
    end
  end
end