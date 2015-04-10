class AudiosController < ApplicationController
#TODO: check forvo auth token
  def get_forvo_audio
    audio_choices = ForvoApi.get_word_pronunciations(params[:word], params[:limit])
    @audio_choices = audio_choices["items"]
    render :choose_forvo
  end

  def create
    data = JSON.parse(params[:data])
    if audio = current_user.create_audio!(forvo_id: data["id"], word: data["word"].downcase, lang_code: data["code"], speaker_gender: data["sex"], forvo_data: params[:data], audio_source: "forvo" )
      #TODO fix amazon upload
      AmazonS3Api.upload_forvo_to_bucket("#{audio.id}-#{audio.word}", data["pathogg"])
      session[:current_exercise_id] = audio.id
      flash[:notice] = "Audio successfully added to lesson!"
      redirect_to exercise_enter_stim_content_path(session[:current_exercise_id])
    else
      #FIXME
    end

  end

  def create_self_audio
    fail #FIXME
  end


end