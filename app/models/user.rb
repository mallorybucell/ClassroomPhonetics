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
    Lesson.create!(course_id: course_id, created_by_teacher_id: self.id, description: description) if self.teaches_course?(course_id)
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

  def teacher?
    self.teacher
  end

  def admin?
    self.admin
  end

  def teaches_course?(course_id)
    self.courses.include?(Course.find(course_id.to_i))
  end

  def get_lessons
    Lesson.where(created_by_teacher_id: self.id)
  end



end
