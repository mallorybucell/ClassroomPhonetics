Rails.application.routes.draw do
  devise_for :users
  
  root 'application#home'

  resources :course do
    resources :lessons, only: [:new, :create, :edit, :update] do
    end
  end

  resources :exercises, only: [:new, :create, :edit, :update] do
    get   '/choose_type'           =>  'exercises#choose_type',            as: 'choose_type'
    post  '/add_type'              =>  'exercises#add_type',               as: 'add_type'
    get   '/select_audio'          =>  'exercises#select_audio',           as: 'select_audio'
    post  '/update_audio'          =>  'exercises#update_audio',           as: 'update_audio'
    get   '/enter_IPA_stim '       =>  'exercises#enter_IPA_stim',         as: 'enter_IPA_stim' 
    post  '/update_IPA_stim'       =>  'exercises#update_IPA_stim',        as: 'update_IPA_stim'
    get   '/enter_base_lang_stim'  =>  'exercises#enter_base_lang_stim',   as: 'enter_base_lang_stim'
    post  '/update_base_lang_stim' =>  'exercises#update_base_lang_stim',  as: 'update_base_lang_stim'
  end

  # get '/return_words' => 'lessons#return_words'
end
