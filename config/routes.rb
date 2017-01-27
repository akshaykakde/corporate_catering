Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  devise_for :users, :skip => [:registrations] 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  resources :vendors do
  	resources :menu_items
  end	
  post 'vendors/select_vendors' => 'vendors#select_vendors', :as => 'select_vendors'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: "home#index"
end
