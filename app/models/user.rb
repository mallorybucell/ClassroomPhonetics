class User < ActiveRecord::Base
  class UnauthorizedError < StandardError; end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
         #TODO remove registerable

  has_many :assignments
  has_many :user_courses
  has_many :courses, through: :user_courses

  def create_lesson!(course_id, description)
    l = Lesson.create!(course_id: course_id, created_by_teacher_id: self.id, description: description) if self.user_course_teacher?(course_id)
    l
  end

  def create_exercise(ex_code)
    Exercise.create!(exercise_code: ex_code, created_by_teacher_id: self.id)
  end

  def user_course_teacher?(course_id)
    self.user_courses.where(course_id: course_id.to_i).first.user_role == "teacher"
  end

end
