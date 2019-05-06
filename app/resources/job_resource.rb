class JobResource < ApplicationResource
  attribute :title, :string
  attribute :description, :string
  has_many :candidatures
  has_many :users
end
