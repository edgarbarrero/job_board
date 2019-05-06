class User < ApplicationRecord
  has_many :candidatures
  has_many :jobs, through: :candidatures
end
