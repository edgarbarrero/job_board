class UserResource < ApplicationResource
  attribute :name, :string
  attribute :kind, :string
  has_many :candidatures
  has_many :jobs
end
