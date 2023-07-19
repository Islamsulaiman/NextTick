# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do
    it "is valid with a name between 2 and 100 characters" do
      category = Category.new(name: "Valid Category Name")
      expect(category).to be_valid
    end

    it "is invalid without a name" do
      category = Category.new(name: "")
      expect(category).to_not be_valid
      expect(category.errors[:name]).to include("can't be blank")
    end

    it "is invalid with a name less than 2 characters" do
      category = Category.new(name: "A")
      expect(category).to_not be_valid
      expect(category.errors[:name]).to include("is too short (minimum is 2 characters)")
    end

    it "is invalid with a name longer than 100 characters" do
      long_name = "A" * 101
      category = Category.new(name: long_name)
      expect(category).to_not be_valid
      expect(category.errors[:name]).to include("is too long (maximum is 100 characters)")
    end
  end

  context "associations" do
    it "has many projects" do
      expect(Category.reflect_on_association(:projects).macro).to eq(:has_many)
    end
  end
end
