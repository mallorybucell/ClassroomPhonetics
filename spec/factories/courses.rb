FactoryGirl.define do
  factory :course do
    course_name "Course"
    sequence(:internal_id) { |n| n }
    semester  "Fall"
    year      "2015"
    instructor_ids  [1, 2].to_s  #DELETE THIS 
  end

end
