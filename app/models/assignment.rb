class Assignment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :lesson

  def self.set!(student_id, lesson_id, due_at, teacher_id)
    Assignment.create!(
      student_id: student_id, 
      lesson_id: lesson_id, 
      due_at: DateTime.parse(due_at),
      assigned_by: teacher_id 
      )
  end

  def get_relative
    if self.due_at.past?
      "ago"
    else
      "from now"
    end
  end
end
