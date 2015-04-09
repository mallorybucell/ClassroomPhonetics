class ExercisesController < ApplicationController
  before_action :authenticate_teacher!
  before_action :authenticate_exercise_owner!, except: [:new, :create] #TODO extract this out to a helper since also used in lessons controller

  #TODO protect flow so have to follow- can't just curl in to step if prev not completedf
  def new
    @exercise = Exercise.new
    @options = Exercise.content_types_and_explanation
  end

  def create
      #TODO params security
    if  @_current_exercise = current_user.create_exercise(params[:exercise][:exercise_code])
        flash[:notice] = "New exercise created. Please choose a type for this exercise."
        redirect_to redirect_by_exercise_type
    else
      flash[:alert] = "Something went wrong. Please try again." #TODO consolidate this
      render :new
    end
  end

  def pick_audio
    @_current_exercise
  end

  def preview_audio
    render :preview_audio
  end

  def update_audio
    #TODO make this a method on Forvo_Api for storing data
    if @_current_exercise.update!(forvo_id: params[:forvo_id], word: params[:word], lang_code: params[:lang_code], speaker_gender: params[:speaker_gender], audio_source: params[:audio_source], added_by_teacher_id: current_user.id, forvo_data: params[:forvo_data])
     flash[:notice]
      redirect_to redirect_by_exercise_type
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :audio
    end
  end

  def enter_stim_content
    @_current_exercise
  end

  def update_stim_content
   if @_current_exercise.update!(content: params[:content])
      @_current_exercise = @_current_exercise
      redirect_to redirect_by_exercise_type
    else
      flash[:notice] = "Something went wrong. Please try again."
      render :content
    end
  end

 private
  def exercise_params #TODO: FIX create function to take this (user func takes 2 args OR pass in params more securely
    params.require(:lesson).permit(:course_id, :description)
  end

  def audio_params
    fail #TODO
  end

  def authenticate_teacher!
    raise User::UnauthorizedError unless current_user.teacher?
    #TODO change user_role to enum
    #TODO define UnauthorizedError
  end

  def authenticate_exercise_owner!
    #TODO security
    raise User::UnauthorizedError unless Exercise.find(params["exercise_id"].to_i).created_by_teacher_id == current_user.id
  end

  def redirect_by_exercise_type
    if @_current_exercise.exercise_code == "L-WI"
      exercise_pick_audio_path(@_current_exercise.id)
    else
      exercise_enter_stim_content_path(@_current_exercise.id)
    end
  end

end