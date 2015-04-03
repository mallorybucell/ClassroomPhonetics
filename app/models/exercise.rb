class Exercise < ActiveRecord::Base
  has_many :lesson_exercises
  has_many :lessons, through: :lesson_exercises

  def create_exercise(exercise_code)
  end

end
