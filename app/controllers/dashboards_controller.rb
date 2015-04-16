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
    #TODO profile settings
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


end