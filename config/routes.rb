Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  get '/users/hr_dashboard', to: 'users#hr_dashboard'
  resources :vendors do
  	resources :menu_items
  end	
  post 'vendors/select_vendors' => 'vendors#select_vendors', :as => 'select_vendors'

  resources :users do
    resources :orders
  end

  post 'orders/place_orders' => 'orders#place_orders', :as => 'place_orders'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
