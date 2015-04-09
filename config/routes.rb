Rails.application.routes.draw do
  devise_for :users
  
  root 'application#home'

  resources :course do
  end

  resources :audios, only: [:create] do
  end
  post '/audios/get_forvo' => 'audios#get_forvo_audio',  as: 'get_from_forvo'

  post '/save_recording' => 'audios#create_self_audio',  as: 'create_self_audio'



  resources :lessons, only: [:new, :create, :show, :edit, :update] do
    get '/choose_exercise'  =>  'lessons#choose_exercise',        as: 'choose_exercise'
    post '/add_exercise'    =>  'lessons#add_exercise',           as: 'add_exercise'
    post '/remove_exercise' =>  'lessons#remove_exercise',        as: 'remove_exercise' 
  end

  scope '/assignments' do
    resources :responses
  end

  resource :assignments, only: [:new, :create] do
    post '/confirm' => 'assignments#confirm',   as: 'confirm'
  end

  resources :exercises, only: [:new, :create, :edit, :update] do
    get   '/pick_audio'            =>  'exercises#pick_audio',            as: 'pick_audio'
    post  '/preview_audio'         =>  'exercises#previw_audio',           as: 'preview_audio' 
    post  '/update_audio'          =>  'exercises#update_audio',           as: 'update_audio'
    get   '/enter_stim_content'    =>  'exercises#enter_stim_content',     as: 'enter_stim_content' 
    post  '/update_stim_content'   =>  'exercises#update_stim_content',    as: 'update_stim_content'

  end

  # get '/return_words' => 'lessons#return_words'
end
