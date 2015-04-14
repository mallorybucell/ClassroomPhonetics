class AssignmentsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :validate_lesson!
  before_action :authenticate_student!, only: [:show]

  def new
    @assignment = Assignment.new
  end

  def create
    #TODO: validate can't set same assignment with same due date on same course
    @course = Course.find(params["course_id"].to_i)
    students = lookup_course_students
    if students.each do |student|
      Assignment.set!(student.id, params["lesson_id"].to_i, params["assignment"]["due_at"], current_user.id)
      end
      flash[:notice] = "Lesson assigned to students in #{@course.course_name}"
      redirect_to lesson_path(params["lesson_id"])
    else
      flash[:notice] = e || "Something whent wrong, please try again."
      redirect_to lesson_path(params["lesson_id"])
    end
  end

  def show
  end

  def index
    @assignments = Assignment.where(assigned_by: current_user.id).includes([:lesson]) #TODO, why does :user include only pull current_user- devise??
    @lessons = get_lessons_from_assignments
  end

  private
    def lookup_course_students
      @course.get_roster
    end

    def validate_lesson!
      Lesson.find(params["lesson_id"]).exercises.count >= 1
      rescue StandardError => e
    end

    def get_lessons_from_assignments
      @assignments.select(:lesson_id).distinct
    end

end