Rails.application.routes.draw do
  devise_for :users, :skip => [:registrations], :controllers => { :sessions => "users/sessions" } 
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  get '/users/welcome', to: 'users#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
