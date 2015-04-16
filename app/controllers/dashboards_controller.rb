class DashboardsController < ApplicationController

  def show
    @courses = current_user.courses
    get_open_assignments
    render :teacher
  end

  private


    def get_open_assignments
      @open_assignments = []
      Assignment.where(assigned_by: current_user.id).includes([:lesson]).each do |assignment|       @open_assignments << assignment if assignment.due_at.future?
       end
      @by_lesson = get_lessons_from_open_assignments
    end

    def get_lessons_from_open_assignments
      @open_assignments.uniq { |a| a.lesson_id }
     end


end