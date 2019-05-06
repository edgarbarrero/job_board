class Job < ApplicationRecord
  belongs_to :company, class_name: 'User'
  has_many :candidatures
  has_many :users, through: :candidatures
end
