FactoryGirl.define do
  factory :user_course do
    user
    course
    user_role "student"
  end

end
