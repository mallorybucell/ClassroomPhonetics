class ExercisesController < ApplicationController
  before_action :authenticate_teacher! #TODO extract this out to a helper since also used in lessons controller

  def new
    @exercise = Exercise.new
  end

  def create
  end

  def choose_type
    #opt show stem if ajax enabled
  end

  def select_audio
  end

  def enter_IPA_stim
  end

  def enter_def_lang_stim
  end
    


 private
  def exercise_params #TODO: FIX create function to take this (user func takes 2 args OR pass in params more securely
    params.require(:lesson).permit(:course_id, :description)
  end

  def authenticate_teacher!  
    raise User::UnauthorizedError unless (current_user.user_courses.where(course_id: params[:course_id]).first.user_role == "teacher")
    #TODO change user_role to enum
    #TODO define UnauthorizedError
  end
end