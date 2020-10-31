Rails.application.routes.draw do
  resources :reviews
  resources :orders
  resources :products
  resources :options
  resources :restaurants
  resources :carts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  post "/users/login", to: "users#login"
  get "/users/keep_logged_in", to: "users#keep_logged_in"

end
