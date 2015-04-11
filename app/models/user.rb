class User < ActiveRecord::Base
  class UnauthorizedError < StandardError; end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
         #TODO remove registerable

  has_many :assignments
  has_many :lessons
  has_many :user_courses
  has_many :courses, through: :user_courses

  def create_lesson!(course_id, description)
    l = Lesson.create!(course_id: course_id, created_by_teacher_id: self.id, description: description) if self.user_course_teacher?(course_id)
    l
  end

  def create_exercise!(ex_code)
    Exercise.create!(exercise_code: ex_code, created_by_teacher_id: self.id)
  end

  def create_audio!(forvo_id: nil, word: nil, lang_code: nil, speaker_gender: nil, forvo_data: nil, audio_source: nil)
    Audio.create!(
      forvo_id: forvo_id,
      word: word,
      lang_code: lang_code,
      speaker_gender: speaker_gender,
      forvo_data: forvo_data,
      added_by_teacher_id: self.id,
      audio_source: audio_source
      )
  end

  def user_course_teacher?(course_id)
    self.user_courses.where(course_id: course_id.to_i).first.user_role == "teacher"
  end

  def get_lessons
    Lesson.where(created_by_teacher_id: self.id)
  end

end
