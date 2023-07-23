# spec/factories/users.rb

FactoryBot.define do
    factory :user do
      email { "userFactory@example.com" }
      password { "password" }
      # Add any other attributes as needed
    end
  end
  