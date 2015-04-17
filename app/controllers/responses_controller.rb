class ResponsesController < ApplicationController

  #responses actions

  # def new
  # end

  # def create
    # a = Assignment.all; a.each do |a| ;    a.lesson.exercises.each do |e| ; Response.create!(assignment_id: a.id, exercise_id: e.id, content: Faker::Lorem.sentence); end; end
  # end

  # def edit
  # end

  # def update
  # end

  # def submit
  # end


#Feedback actions. Consider whether this should be separate controller

  def edit_feedback
    @response = Response.find(params["response"])
    if @response.feedback_submitted_at.nil?
      render :edit_feedback
    else
      flash[:alert] = "This feedback has already been submitted to the student and cannot be edited. Please review another assignment."
      redirect_to :back
    end
  end

  def update_feedback
    response = Response.find(params["response"])
    if response.feedback.update!(feedback_params.merge(feedbacker_id: current_user.id))
      flash[:notice] = "Feedback on this response saved!"
      redirect_to response_feedback_main(response)
    else
      flash[:alert] = "Oops- that feedback could not be saved. Please try again."
      redirect_to :back
    end
  end

  def submit_feedback
    assignment = Assignment.find(params["assignment"])
   if assignment.responses.all do |r|
      #make sure all responses have comment
      #mark feedback submitted_at to Time.now
      end
      redirect_to feedback_main
    else
      flash[:alert] = "Something went wrong!"
      redirect_to :back
    end

  end



end