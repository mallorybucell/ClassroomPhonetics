FactoryGirl.define do
  factory :course do
    course_name "Course"
    sequence(:course_id) { |n| n.to_i }
    semester  "Fall"
    year      "2015"
    instructor_ids  [1, 2].to_s   
  end

end
