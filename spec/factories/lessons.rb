FactoryGirl.define do
  factory :lesson do
    sequence(:course)
    sequence(:user)
  end

end
