# require 'rails_helper'

# RSpec.describe Category, type: :model do
#   describe "validations" do
#     it "is valid with valid attributes" do
#       # category = FactoryBot.build(:category)
#       category = Category.new(name:'food')
#       puts category.name
#       expect(category).to be_valid
#     end
    
#     it "is not valid without a name" do
#       category = FactoryBot.build(:category, name: nil)
#       expect(category).not_to be_valid
#     end
    
#     it "is not valid with a name less than 2 characters" do
#       category = FactoryBot.build(:category, name: "a")
#       expect(category).not_to be_valid
#     end
    
#     it "is not valid with a name longer than 100 characters" do
#       category = FactoryBot.build(:category, name: "a" * 101)
#       expect(category).not_to be_valid
#     end
#   end
# end