class Lesson < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :course
  has_many    :assignments
  has_many    :lesson_exercises
  has_many    :exercises, through: :lesson_exercises

  validates_presence_of :course, :description
  validates_uniqueness_of :description

  def get_exercises
    self.exercises
  end


end
