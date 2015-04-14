class Assignment < ActiveRecord::Base
  belongs_to  :student
  belongs_to  :lesson

  validates_presence_of :due_at

  def self.set!(student_id, lesson_id, due_at, teacher_id)
    assignment = Assignment.create!(
                  student_id: student_id, 
                  lesson_id: lesson_id, 
                  due_at: DateTime.parse(due_at),
                  assigned_by: teacher_id 
                  )
    raise Assignment::InvalidDateError unless assignment
  end

  def get_relative
    if self.due_at.past?
      "ago"
    else
      "from now"
    end
  end

  def is_submitted
    !self.submitted_at.nil?
  end

  def student
    User.find(self.student_id)
  end

  def current_status
    if self.due_at.future?
      "Assigned"
    elsif self.due_at.past?
      "Unassigned"
    else
      "Unused"
    end
  end
end
