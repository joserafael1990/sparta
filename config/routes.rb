Rails.application.routes.draw do

  get 'states/find_states_given_country_id'
  get 'cities/find_cities_given_state_id'

  resources :admin  
  resources :categories
  resources :cities
  resources :countries
  resources :no_admin
  resources :states
  resources :people


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => '', :path_names => 
  {:sign_in => 'login', :sign_out => 'logout',  :sign_up => 'signup', :edit => 'profile'}
  resources :users
  root  "home#index"
end
