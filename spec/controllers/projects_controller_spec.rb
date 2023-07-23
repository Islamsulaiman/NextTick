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

#   describe 'POST #create' do
#     context 'with valid attributes' do

#           it 'creates a new project' do
#             user = User.create(email: "user@example.com", password: "password")
#             sign_in user
    
#             category = FactoryBot.create(:category) # Create a Category record using FactoryBot
    
#             project_params = {
#               project: {
#                 name: 'New Project', # Invalid project name (empty)
#                 user_id: user.id,
#                 category_id: category.id
#               }
#             }
    
#             expect {
#               post '/projects', params: project_params # Use 'post' for request type
#             }.to change(Project, :count).by(1)
    
#             expect(response).to have_http_status(:created)
#           end
    

#     end

#     context 'with invalid attributes' do
#       it 'does not create a new project' do
#         user = User.create(email: "user@example.com", password: "password")
#         sign_in user

#         category = FactoryBot.create(:category) # Create a Category record using FactoryBot

#         project_params = {
#           project: {
#             name: '', # Invalid project name (empty)
#             user_id: user.id,
#             category_id: category.id
#           }
#         }

#         expect {
#           post '/projects', params: project_params # Use 'post' for request type
#         }.not_to change(Project, :count)

#         expect(response).to have_http_status(:unprocessable_entity)
#       end
#     end
#   end

describe "POST /projects" do
    let(:user) { FactoryBot.create(:user) }
    let(:category) { FactoryBot.create(:category) }



    context "with valid attributes" do
      it "creates a new project" do
        puts user.id
        # puts user.name

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

        expect(response).to have_http_status(:created)
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
        }.not_to change(Project, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end


end
