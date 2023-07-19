# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe "Test Categories routes", type: :request do

  describe 'GET #index' do
    it 'returns a successful response' do
      user = User.create(email: "user@example.com", password: "password")
      puts user.password
      sign_in user
      get '/categories'
      expect(response).to have_http_status(200) # Check for the success HTTP status
    end
  end
end