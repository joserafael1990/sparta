Rails.application.routes.draw do

  get 'cities/index'

  get 'cities/show'

  get 'cities/destroy'

  resources :admin  
  resources :categories
  resources :no_admin
  resources :states
  resources :cities

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => '', :path_names => 
  {:sign_in => 'login', :sign_out => 'logout',  :sign_up => 'signup', :edit => 'profile'}
  resources :users
  root  "home#index"
end
