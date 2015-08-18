Rails.application.routes.draw do

  root "page#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :applications
  resources :pins
 
  #Usuarios
  resources :users
  get 'fb/:uid' => 'users#show', as: :fb_uid
  post 'users/register' => "users#create", :as => :user_register

  resources :courses, only: [:show,:index]
  resources :universities, only: [:show,:index]

  get 'token/create' 
  get 'token/destroy'


end
