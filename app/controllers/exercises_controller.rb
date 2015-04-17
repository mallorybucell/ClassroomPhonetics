class ExercisesController < ApplicationController
  before_action :authenticate_teacher!
  # before_action :authenticate_exercise_owner!, except: [:new, :create] #TODO extract this out to a helper; also figure out why bytesize error

  #TODO protect flow so have to follow- can't just curl in to step if prev not completedf
  def new
    @exercise = Exercise.new
    @options = Exercise.content_types_and_explanation
  end

  def create
    if current_exercise = Exercise.create!(exercise_params.merge(created_by_teacher_id: current_user.id))
      session[:current_exercise_id] = current_exercise.id
      flash[:notice] = "New exercise started. Please continue entering the exercise content."
      redirect_to redirect_by_exercise_type
    else
      flash[:alert] = "Sorry- we couldn't create that exercise. Please try again." #TODO consolidate this
      render :new
    end
  end



  def edit
    if @ex = get_exercise_from_session
      render :edit
    else
      flash[:alert] = "We could not find the exercise you were looking for. Please try again later."
      redirect_to :back
    end
  end

  def update
    @exercise = get_exercise_from_session
    if @exercise.update!(update_params)
      flash[:notice] = "Updated successfully!"
      redirect_to :back
    else
      flash[:alert] = "Sorry- something went wrong!"
      redirect_to :back
    end
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
    if get_exercise_from_session.update!(audio_id: params[:audio_id])
      flash[:notice] = "Audio saved and added to exercise."
      redirect_to exercise_enter_stim_content_path(get_exercise_from_session)
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :audio
    end
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
  def exercise_params
    params.require(:exercise).permit(:exercise_code, :description)
  end

  def update_params
    params.fetch(:exercise, {}).permit(:content, :answer_key, :description)
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



  