# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

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

    # it 'returns the created category' do
    #   category_params = { name: 'New Category' }

    #   post '/categories', params: { category: category_params }
    #   created_category = Category.last

    #   expect(response).to have_http_status(:created)
    #   expect(response.body).to eq(created_category.to_json)
    # end

    # it 'returns unprocessable_entity status for invalid category' do
    #   category_params = { name: '' } # Invalid category without a name

    #   post '/categories', params: { category: category_params }

    #   expect(response).to have_http_status(:unprocessable_entity)
    # end

  end


end