class CoursesController < ApplicationController
  before_action :verify_admin!, except: [:teacher_index, :show]
  before_action :authenticate_teacher!, only: [:teacher_index, :show]

  def teacher_index
    @courses = current_user.courses
  end

end