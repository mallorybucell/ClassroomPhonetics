require 'rails_helper'

RSpec.describe User, type: :model do

it 'can give feedback if teacher' #Need exercise implemented first

it 'can create a lesson if teacher' do
  teacher = FactoryGirl.create :user
  course =  FactoryGirl.create :course
  FactoryGirl.create :user_course, course_id: course.id, user_id: teacher.id, user_role: "teacher"
  desc = "this is a test description."
  teacher.create_lesson!(course.id, desc)
end

it 'can create an exercise if teacher'

it 'can create assignments if teacher'

it 'cannot create assignments if student'

it 'can view assignments if student'

it 'can edit assignments if student'

it 'can submit assignments if student'

# Add course Activity functionality



end
