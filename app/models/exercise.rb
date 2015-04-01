class Exercise < ActiveRecord::Base
  has_many :lesson_exercises
  has_many :lessons, throught: :lesson_exercises
end
