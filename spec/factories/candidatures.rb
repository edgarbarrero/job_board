FactoryBot.define do
  factory :candidature do
    user_id { 1 }
    job_id { 1 }
    state { "MyString" }
  end
end
