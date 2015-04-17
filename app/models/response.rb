class Response < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :exercise

  def self.count_needs_feedback(user)
    # Response.where(feedback_submitted_at: nil).includes(:assignments).where.not('assignments.submitted_at': nil).where(assigned_by: user.id).references(:assignments)
    responses = Response.where(feedback_submitted_at: nil)
    counter = 0
    responses.each do |r|
    a =Assignment.find(r.assignment_id)
    if a.submitted_at.nil? == false
        counter += 1
      end
    end
    return counter
  end

  def self.new_submits(user)
    # # Response.includes(:assignments).where('assignments.submitted_at': (user.last_sign_in_at..Time.now)).references(:assignments)
    # responses = Response.where(feedback_submitted_at: nil)
    # counter = 0
    #   responses.each do |r|
    #     a = Assignment.find(r.assignment_id)
    #     if a.submitted_at.not.nil? && a.submitted_at.after?(user.last_sign_in_at)
    #       counter += 1
    #     end
    #   end
      counter = rand(1..5)
  end
end
