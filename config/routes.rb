Rails.application.routes.draw do
  # get 'home/index'
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  # root "managers#index"
  resources :managers
end
