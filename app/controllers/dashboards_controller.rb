class DashboardsController < ApplicationController

  def show
    if current_user.teacher?
        @courses = current_user.courses
        get_open_assignments
        render :teacher
      else
        redirect_to new_user_session_path
      end
  end

  def profile
  end

  private

    def get_open_assignments
     @open_assignments = []
     Assignment.where(assigned_by: current_user.id).includes([:lesson]).each do |assignment|
        @open_assignments << assignment if assignment.due_at.future?
      end
     @by_lesson = get_lessons_from_open_assignments
    end

    def get_lessons_from_open_assignments
      @open_assignments.uniq { |a| a.lesson_id }
    end

    # def student_dash_info
    #   get_dash_assignments
    #   @current_courses = current_user.courses
    #   @current_activities = "Coming soon" #TODO current_activities
    # end

    # def teacher_dash_info
    #   get_dash_lessons
    #   get_dash_exercises
    #   get_dash_assignments
    #   @current_courses = current_user.courses
    #   @current_activities = "Coming soon"
    # end

    # def get_dash_lessons
    #   @lessons_in_progress = current_user.get_lessons #FIXME
    # end
    # #   @lessons_recent_submit #= fail


    # def get_dash_exercises
    #   @exercises_in_progress #= fail
    #   @exercises_recent_submit #= fail
    # end

    # def get_dash_assignments
    #   @open_assignments #= fail
    #   @recent_assignment_submits #= fail
    #   @past_assignments #= fail
    # end


end