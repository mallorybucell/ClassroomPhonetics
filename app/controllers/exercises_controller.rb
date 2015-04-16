class ExercisesController < ApplicationController
  before_action :authenticate_teacher!
  # before_action :authenticate_exercise_owner!, except: [:new, :create] #TODO extract this out to a helper; also figure out why bytesize error

  #TODO protect flow so have to follow- can't just curl in to step if prev not completedf
  def new
    @exercise = Exercise.new
    @options = Exercise.content_types_and_explanation
  end

  def create
    current_exercise = Exercise.create!(created_by_teacher_id: current_user.id, params[])
    session[:current_exercise_id] = current_exercise.id
    flash[:notice] = "New exercise started. Please continue entering the exercise content."
    redirect_to edit_exercise_path(current_exercise)
  end

  def edit
  end

  def pick_audio
    @_current_exercise = get_exercise_from_session
    @_existing_audio = Audio.display_all
  end

  def preview_audio
    render :preview_audio
  end

  def update_audio
    #TODO validate so lesson can only have one audio? Or explicit pick # of files
    #TODO make this a method on Forvo_Api for storing data
    if get_exercise_from_session.update!(forvo_id: params[:forvo_id], word: params[:word], lang_code: params[:lang_code], speaker_gender: params[:speaker_gender], audio_source: params[:audio_source], added_by_teacher_id: current_user.id, forvo_data: params[:forvo_data])
      flash[:notice] = "Audio saved and added to exercise."
      redirect_to redirect_by_exercise_type
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :audio
    end
  end

  def use_existing_audio
    get_exercise_from_session.update!(audio_id: params[:audio_id])
  end

  def enter_stim_content
    @_current_exercise = get_exercise_from_session
  end

  def update_stim_content
    @exercise = get_exercise_from_session
    if @exercise.update!(content: params[:content], answer_key: params[:answer_key], description: @exercise.create_description(params[:answer_key]) )
      flash[:notice] = "Exercise '#{get_exercise_from_session.description}' created and saved! You can now add it to a lesson."
      session[:current_exercise_id] = nil
      redirect_to lesson_choose_exercise_path(session[:lesson_id])
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

  def authenticate_exercise_owner!
    raise User::UnauthorizedError unless Rack::Utils.secure_compare(current_user.id, (Exercise.find(params["exercise_id"].to_i).created_by_teacher_id)) || Rack::Utils.secure_compare(get_exercise_from_session.created_by_teacher_id, current_user.id)
  end

  def redirect_by_exercise_type
    ex = get_exercise_from_session
    if ex.exercise_code == "L-WI"
      exercise_pick_audio_path(ex.id)
    else
      exercise_enter_stim_content_path(ex.id)
    end
  end

end