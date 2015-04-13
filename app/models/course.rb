class Course < ActiveRecord::Base
  has_many  :user_courses
  has_many  :users, through: :user_courses
  has_many  :lessons

  validates_presence_of :course_name

  def get_roster 
    self.users.where(student: true)
  end

  def get_open_assignments
    open_assignments = []
    self.get_roster.each do |student|
      Assignment.where(user_id: student.id) do |a|
        if a.due_at.future?
          open_assignments << a
        end
      end
    end
    @open_assignments = open_assignments
  end
end
