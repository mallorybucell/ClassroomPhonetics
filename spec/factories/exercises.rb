FactoryGirl.define do
  factory :exercise do
    exercise_code "MyString"
    sequence(:forvo_id) { |n| n.to_i } 
    content "MyText"
  end

end
