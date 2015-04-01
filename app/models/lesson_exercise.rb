class LessonExercise < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :exercise
end
