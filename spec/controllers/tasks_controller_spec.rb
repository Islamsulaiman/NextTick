# spec/controllers/projects_controller_spec.rb
require 'rails_helper'

RSpec.describe "Test tasks routes", type: :request do

    include Devise::Test::IntegrationHelpers # Include Devise test helpers

    describe 'GET # index' do

        it 'Tasks returned correctly' do
            user = User.create(email: "user@example.com", password: "password")
            sign_in user

            get '/tasks'
            expect(response).to have_http_status(200) # Check for the success HTTP status
        end
    end

    describe 'POST #new task' do 
        let(:project) { FactoryBot.create(:project) }

        context 'with valid attributes' do
            it "create new task" do

                puts "the project is"
                puts project.id

                user = User.create(email: "user@example.com", password: "password")
                sign_in user

                task_params = {
                    task: {
                      name: "Test tasks",
                      project_id: project.id,
                      status: "in_progress",
                      time_elapsed: 1
                    }
                  }

                  expect {
                    post '/tasks', params: task_params
                  }.to change(Task, :count).by(1)

                  expect(response).to have_http_status(302)
            end
        end


    end
end