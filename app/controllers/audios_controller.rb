class AudiosController < ApplicationController

  def get_forvo_audio
    audio_choices = ForvoApi.get_word_pronunciations(params[:word], params[:limit])
    @audio_choices = audio_choices["items"]
    render :choose_forvo
  end

  def create
    binding.pry
    #TODO
    Audio.create!()
  end

  def create_self_audio
    binding.pry
  end


end