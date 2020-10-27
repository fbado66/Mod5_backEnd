Rails.application.routes.draw do
  resources :reviews
  resources :orders
  resources :products
  resources :options
  resources :restaurants
  resources :carts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
