class Category < ApplicationRecord
    has_many :projects
  
    validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  end