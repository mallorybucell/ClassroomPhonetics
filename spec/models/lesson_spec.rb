require 'rails_helper'

RSpec.describe Lesson, type: :model do

it 'can be created by a teacher'

it 'can only be assigned to each student once' #does this go in assignments?

it 'can only be assigned by a teacher or admin of a course it belongs tos' do
    c = FactoryGirl.create  :course
    l = FactoryGirl.create  :lesson, course_id: c.id
    u = FactoryGirl.create  :user
    uc = FactoryGirl.create :user_course, user_id: u.id, course_id: c.id, user_role: "teacher"

    c = FactoryGirl.create  :course
    l = FactoryGirl.create  :lesson, course_id: c.id
    u = FactoryGirl.create  :user
    uc = FactoryGirl.create :user_course, user_id: u.id, course_id: c.id, user_role: "teacher"


    c = FactoryGirl.create  :course
    l = FactoryGirl.create  :lesson, course_id: c.id
    u = FactoryGirl.create  :user
    uc = FactoryGirl.create :user_course, user_id: u.id, course_id: c.id, user_role: "teacher"
end

it 'it cannot be assigned if not associated with a course'

it 'can use audio from forvo'

it 'cannot be created by a student'

it 'must belong to at least one course'

it 'knows where its audio is'#This may be redundant/unnecessary now that we have exercises.

it 'cannot be saved without a description'

it 'cannot be edited if it is assigned'


end
