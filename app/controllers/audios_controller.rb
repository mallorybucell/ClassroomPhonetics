class AudiosController < ApplicationController
#TODO: check forvo auth token
  def get_forvo_audio
    audio_choices = ForvoApi.get_word_pronunciations(params[:word], params[:limit]) #if verify forvo
    if audio_choices.code >= 500 && audio_choices.code < 600
      flash[:warning] = "Sorry, Forvo is down right now. You could record your own audio or use existing audio, or just try again later."
      redirect_to :back
    else
      @audio_choices = audio_choices["items"]
      render :choose_forvo
    end
  end

  def create
    data = JSON.parse(params[:data])
    @exercise = get_exercise_from_session
    if audio = current_user.create_audio!(forvo_id: data["id"], word: data["word"].downcase, lang_code: data["code"], speaker_gender: data["sex"], forvo_data: params[:data], audio_source: "forvo" )
      #TODO fix amazon upload
      AmazonS3Api.upload_forvo_to_bucket(audio.filename, data["pathogg"])
      flash[:notice] = "Audio '#{audio.filename}' successfully added to exercise '#{@exercise.id}"
      redirect_to exercise_enter_stim_content_path(@exercise)
    else
      flash[:alert] = "Oops! We couldn't add that audio to exercise '#{@exercise.id}. Please try again."
      render :choose_forvo
    end

  end

  def create_self_audio
    fail #FIXME
  end


end