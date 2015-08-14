Rails.application.routes.draw do

  root "page#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :applications
  resources :pins
  resources :users
  resources :courses
  resources :universities, only: [:show,:index]

  get 'token/create'
  get 'token/destroy'


end
