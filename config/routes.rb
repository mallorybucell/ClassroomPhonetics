Rails.application.routes.draw do
  devise_for :users
  
  root 'application#home'

  resources :course do
    resources :lessons, only: [:new, :create, :edit, :update] do
    end
  end

  resources :exercises

  # get '/return_words' => 'lessons#return_words'
end
