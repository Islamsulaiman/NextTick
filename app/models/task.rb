class Task < ApplicationRecord
  belongs_to :project
  enum status: [:pending, :in_progress, :done]
end
