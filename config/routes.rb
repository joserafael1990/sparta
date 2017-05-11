Rails.application.routes.draw do

  get 'borrowings/find_pendings_given_employee_id'
  get 'catalogs/find_products_given_category_id'
  get 'cities/find_cities_given_state_id'
  get 'states/find_states_given_country_id'
  get 'people/find_location_given_people_id'
  get 'sales/close'
  get 'sales/send_ticket'
  get 'user_mailer/send_ticket'
    
    resources :attends  
    resources :borrowings
    resources :categories
    resources :catalogs
    resources :cities
    resources :events
    resources :countries
    resources :details
    resources :dispatchers
    resources :payments
    resources :people
    resources :products
    resources :sales
    resources :states

    resources :admin
    resources :home
    resources :no_admin

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :path => '', :path_names => 
  {:sign_in => 'login', :sign_out => 'logout',  :sign_up => 'signup', :edit => 'profile'}
  resources :users
  root  "home#index"
end
