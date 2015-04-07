class Course < ActiveRecord::Base
  has_many  :user_courses
  has_many  :users, through: :user_courses
  has_many  :lessons

  validates_presence_of :course_name
end
