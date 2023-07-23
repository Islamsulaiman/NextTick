# spec/factories/projects.rb

FactoryBot.define do
    factory :project do
      name { "Sample Project" }
      association :user
      association :category
      # Add any other attributes as needed
    end
  end
  