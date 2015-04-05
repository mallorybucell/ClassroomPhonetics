class ExercisesController < ApplicationController
  before_action :authenticate_teacher!
  before_action :authenticate_exercise_owner!, except: [:new, :create] #TODO extract this out to a helper since also used in lessons controller

  #TODO protect flow so have to follow- can't just curl in to step if prev not completedf
  def new
    @exercise = Exercise.new
  end

  def create
    #TODO params security
  if  @_current_exercise = current_user.create_exercise(params[:description])
      @_current_exercise = @_current_exercise
      flash[:notice]= "New exercise created. Please choose a type for this exercise."
      redirect_to exercise_choose_type_path
  else
    flash[:notice] = "Something went wrong. Please try again."
    render :new
  end

  def choose_type
    @_current_exercise

    #TODO enum type??
    #opt show stem if ajax enabled
  end

  def add_type
    if @_current_exercise.update!(exercise_code: params[:e_code])
      @_current_exercise = @_current_exercise
      flash[:notice] = "Exercise type updated successfully." 
      redirect_by_exercise_type
    else
      flash[:notice] = "Something went wrong. Please try again." #TODO consolidate this
      render :type
    end
  end

  def select_audio
    @_current_exercise
  end

  def update_audio
    if @_current_exercise.update!()
  end

  def enter_IPA_stim 
  end

  def enter_base_lang_stim
  end
    


 private
  def exercise_params #TODO: FIX create function to take this (user func takes 2 args OR pass in params more securely
    params.require(:lesson).permit(:course_id, :description)
  end

  def authenticate_teacher!
    raise User::UnauthorizedError unless current_user.teacher?
    #TODO change user_role to enum
    #TODO define UnauthorizedError
  end

  def authenticate_exercise_owner!
    #TODO security
    raise User::UnauthorizedError unless Exercise.find(params["id"].to_i).created_by_teacher_id == current_user.idrr
  end

  def redirect_by_exercise_type
    fail
  end

end