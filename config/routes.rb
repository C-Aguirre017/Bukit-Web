Rails.application.routes.draw do

  root "page#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  #Applications
  resources :applications, only: [:show,:index,:create]

  #Pins
  resources :pins do
    member do
      resources :applications, only: [:index]
    end
  end

  get "pins/search/:word" => "pins#search", as: :pins_search

  #Usuarios
  resources :users do
    resources :pins, only: :index
  end

  get 'fb/:uid' => 'users#show', as: :fb_uid
  post 'users/register' => "users#create", :as => :user_register

  #Cursos
  resources :courses, only: [:show,:index]
  get "courses/search/:word" => "courses#search", as: :course_search

  #Universities
  resources :universities, only: [:show,:index]

  get 'token/create' 
  get 'token/destroy'


end
