class Response < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :exercise

  def self.needs_feedback(user)
    Response.where(feedback_submitted_at: nil).includes(:assignments).where.not('assignments.submitted_at': nil).where(assigned_by: user.id).references(:assignments)
  end

  def self.new_submits(user)
    Response.includes(:assignments).where('assignments.submitted_at': (user.last_sign_in_at..Time.now)).references(:assignments)
  end
end
