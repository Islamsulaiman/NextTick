# spec/controllers/projects_controller_spec.rb
require 'rails_helper'

RSpec.describe "Test projects routes", type: :request do
  include Devise::Test::IntegrationHelpers # Include Devise test helpers

  describe 'GET #index' do
    it 'Projects returned correctly' do
      user = User.create(email: "user@example.com", password: "password")
      sign_in user

      get '/projects'
      expect(response).to have_http_status(200) # Check for the success HTTP status
    end
  end

  describe "POST /projects" do
    let(:user) { FactoryBot.create(:user) }
    let(:category) { FactoryBot.create(:category) }



    context "with valid attributes" do
      it "creates a new project" do

        sign_in user

        project_params = {
          project: {
            name: "Test Project",
            user_id: user.id,
            category_id: category.id
          }
        }

        expect {
          post '/projects', params: project_params
        }.to change(Project, :count).by(1)

        expect(response).to have_http_status(302)
      end
    end

    context "with invalid attributes" do
      it "does not create a new project" do
        project_params = {
          project: {
            name: "",
            user_id: user.id,
            category_id: category.id
          }
        }

        expect {
          post '/projects', params: project_params
        }.to change(Project, :count).by(0)

        expect(response).to have_http_status(302)
      end
    end
  end


end
