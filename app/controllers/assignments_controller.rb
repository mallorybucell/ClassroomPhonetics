class AssignmentsController < ApplicationController
  def new
    @assignment = Assignment.new
  end

  def create
    #pull this out to model
    #get course students
    #for each student, make an assignment
    if Assignment.create!(student_id: params["student_id"], lesson_id: params["lesson_id"], due_date: params["due_date"], due_time: params["due_time"], assigned_by: params["teacher_id"])
      flash[:notice] = "Lesson assigned to students in #{course_name}" #TODO
      render :new
    else
      flash[:notice] = "Something whent wrong, please try again."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def enter_responses
    fail
  end
end