class Lesson < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :course
  has_many    :assignments
  has_many    :exercises
  has_many    :exercises, through: :lesson_exercises

  validates_presence_of :course, :description


end
