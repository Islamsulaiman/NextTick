# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

#test categories route
RSpec.describe "Test Categories routes", type: :request do

  describe 'GET #index' do
    it 'returns a successful response' do
      user = User.create(email: "user@example.com", password: "password")
      sign_in user
      get '/categories'
      expect(response).to have_http_status(200) # Check for the success HTTP status
    end
  end

  describe 'POST /categories' do

    #create new post
    it 'creates a new category' do
      user = User.create(email: "user@example.com", password: "password")
      sign_in user

      puts user.email

      category_params = { name: 'New Category' }
      expect {
        post '/categories', params: { category: category_params }
        puts response
      }.to change(Category, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end




end