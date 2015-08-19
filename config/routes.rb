Rails.application.routes.draw do

  root "page#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :applications
  resources :pins
 
  #Usuarios
  resources :users
  get 'fb/:uid' => 'users#show', as: :fb_uid
  post 'users/register' => "users#create", :as => :user_register

  #Cursos
  resources :courses, only: [:show,:index]
  get "courses/search/:palabra" => "courses#search", as: :course_search

  #Universities
  resources :universities, only: [:show,:index]

  get 'token/create' 
  get 'token/destroy'


end
