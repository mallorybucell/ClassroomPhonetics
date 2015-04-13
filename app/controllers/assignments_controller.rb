class AssignmentsController < ApplicationController
  before_action :authenticate_teacher!

  def new
    @assignment = Assignment.new
  end

  def create
    @course = Course.find(params["course_id"].to_i)
    students = lookup_course_students
    if students.each do |student|
      Assignment.set!(student.id, params["lesson_id"].to_i, params["assignment"]["due_at"], current_user.id)
      end
      flash[:notice] = "Lesson assigned to students in #{@course.course_name}"
      render :new
    else
      flash[:notice] = "Something whent wrong, please try again."
      render :new
    end
  end

  private
    def lookup_course_students
      @course.get_roster
    end

end