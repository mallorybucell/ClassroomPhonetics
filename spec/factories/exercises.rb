FactoryGirl.define do
  factory :exercise do
    exercise_type "MyString"
    sequence(:forvo_id) { |n| n.to_i } 
    content "MyText"
  end

end
