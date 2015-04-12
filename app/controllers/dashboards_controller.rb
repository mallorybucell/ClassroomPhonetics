class DashboardsController < ApplicationController

  def show
    if current_user.teacher?
      teacher_dash_info
      render :teacher
    elsif current_user.admin?
      #TODO admin/course routes and controllers
      render :admin
    else
      student_dash_info
      render :student
    end

  end

  private
    def student_dash_info
      get_dash_assignments
      @current_courses = current_user.courses
      @current_activities = "Coming soon" #TODO current_activities
    end

    def teacher_dash_info
      get_dash_lessons
      get_dash_exercises
      get_dash_assignments
      @current_courses = current_user.courses
      @current_activities = "Coming soon"
    end

    def get_dash_lessons
      @lessons_in_progress = current_user.get_lessons
      @lessons_recent_submit #= fail
    end

    def get_dash_exercises
      @exercises_in_progress #= fail
      @exercises_recent_submit #= fail
    end

    def get_dash_assignments
      @open_assignments #= fail
      @recent_assignment_submits #= fail
      @past_assignments #= fail
    end


end