class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :tasks
end
