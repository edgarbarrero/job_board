class CandidatureResource < ApplicationResource
  attribute :user_id, :integer
  attribute :job_id, :integer
  attribute :state, :string
  belongs_to :user
  belongs_to :job
end
