class Exercise < ActiveRecord::Base
  has_many :lesson_exercises
  has_many :lessons, through: :lesson_exercises

  def create_exercise(exercise_code)
  end

  def stem_text_hash
    fail
  end

  def content_type_explanation_hash
    fail
  end

end
