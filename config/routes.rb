Rails.application.routes.draw do
  root to: 'home#index'
  
  get 'home/index'

  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :companies do
    resources :users do
      get 'search', :on => :collection
    end
  end

  
  get '/users/hr_dashboard', to: 'users#hr_dashboard'
  resources :vendors do
  	resources :menu_items
  end	
  post 'vendors/select_vendors' => 'vendors#select_vendors', :as => 'select_vendors'
  post 'orders/place_orders' => 'orders#place_orders', :as => 'place_orders'

  resources :users do
    resources :orders
  end

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
