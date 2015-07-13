Rails.application.routes.draw do

  devise_for :users
  root "page#index"

  resources :applications
  resources :pins
  resources :users
  resources :courses
  resources :universities

end
