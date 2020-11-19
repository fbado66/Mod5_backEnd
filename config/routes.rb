Rails.application.routes.draw do
  resources :reviews
  resources :orders
  resources :products
  resources :restaurants
  resources :carts
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


 get '/users', to: 'users#index'
  post "/users/login", to: "users#login"
  post '/users', to: 'users#create'
  patch '/users/:id', to: 'users#update'
  get "/users/keep_logged_in", to: "users#keep_logged_in"
  post '/charges', to: 'charges#create'
  get '/charges', to: 'charges#index'

end
