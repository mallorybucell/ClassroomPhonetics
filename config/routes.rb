Rails.application.routes.draw do
  devise_for :users
  
  root 'application#home'

  resources :course do
    resources :lessons, only: [:new, :create, :edit, :update] do
      get '/choose_exercise'  =>  'lessons#choose_exercise',        as: 'choose_exercise'
      post '/add_exercise'    =>  'lessons#add_exercise',           as: 'add_exercise'
    end
  end

  resources :exercises, only: [:new, :create, :edit, :update] do
    get   '/choose_type'           =>  'exercises#choose_type',            as: 'choose_type'
    post  '/add_type'              =>  'exercises#add_type',               as: 'add_type'
    get   '/select_audio'          =>  'exercises#select_audio',           as: 'select_audio'
    post  '/update_audio'          =>  'exercises#update_audio',           as: 'update_audio'
    get   '/enter_stim_content'    =>  'exercises#enter_stim_content',     as: 'enter_stim_content' 
    post  '/update_stim_content'   =>  'exercises#update_stim_content',    as: 'update_stim_content'

  end

  # get '/return_words' => 'lessons#return_words'
end
