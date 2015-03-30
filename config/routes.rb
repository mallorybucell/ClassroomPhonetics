Rails.application.routes.draw do
  devise_for :users
  
  root 'application#home'

  resources :lesson do
  end

  get '/return_words' => 'lessons#return_words'
end
