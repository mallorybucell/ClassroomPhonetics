class Assignment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :lesson

  def self.set!(student_id, lesson_id, due_date, teacher_id)
    Assignment.create!(
      student_id: student_id, 
      lesson_id: lesson_id, 
      due_date: due_date, #FIXME Datetime.parse this
      assigned_by: teacher_id 
      )
  end
end
