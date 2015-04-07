class LessonExercise < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :exercise

  validates_uniqueness_of :exercise, scope: :lesson
end
