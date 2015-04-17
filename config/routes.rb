Rails.application.routes.draw do
  devise_for :users
  
  root 'application#home'

  resources :courses
  
  resource :course, shallow: true do
    get '/teacher_index' =>'courses#teacher_index', as: 'teacher_index'
  end


  resources :audios, only: [:create] do
  end
  post '/audios/get_forvo' => 'audios#get_forvo_audio',  as: 'get_from_forvo'

  post '/save_recording' => 'audios#create_self_audio',  as: 'create_self_audio'



  resources :lessons, only: [:new, :create, :show, :index, :edit, :update] do
    get '/choose_exercise'  =>  'lessons#choose_exercise',        as: 'choose_exercise'
    post '/add_exercise'    =>  'lessons#add_exercise',           as: 'add_exercise'
    patch '/remove_exercise' =>  'lessons#remove_exercise',        as: 'remove_exercise' 
  end


  resources :assignments, only: [ :new, :create, :show, :index] do
    post '/:id/submit' => 'responses#submit', as: 'submit_assignment_responses'
    get '/:id/edit_feedback' => 'responses#edit_feedback', as: 'edit_feedback'
    post '/:id/update_feedback' => 'responses#update_feedback', as: 'update_feedback'
    post '/:id/update_feedback' => 'responses#submit_feedback', as: 'submit_feedback'
  end
  

  scope '/assignments' do
    resources :responses, only: [:new, :create, :edit, :update]
  end


  resources :exercises, only: [:new, :create, :edit, :update, :show, :index] do
    get   '/pick_audio'            =>  'exercises#pick_audio',            as: 'pick_audio'
    post  '/update_audio'          =>  'exercises#update_audio',           as: 'update_audio'
    get   '/enter_stim_content'    =>  'exercises#enter_stim_content',     as: 'enter_stim_content' 
    post  '/update_stim_content'   =>  'exercises#update_stim_content',    as: 'update_stim_content'
    post  '/use_existing_audio'    =>  'exercises#use_existing_audio',     as: 'add_exist_audio' 

  end

  resource :dashboard, only: [:show] do
    get '/profile'  => 'dashboards#profile', as: 'profile'
  end
end
