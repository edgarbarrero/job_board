class JobResource < ApplicationResource
  attribute :title, :string
  attribute :description, :string
  attribute :company_id, :integer
  has_many :candidatures
  has_many :users
end
