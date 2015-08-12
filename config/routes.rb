Rails.application.routes.draw do

  root "page#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #devise_scope :user do
#	delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
 # end

  resources :applications
  resources :pins
  resources :users
  resources :courses
  resources :universities

end
