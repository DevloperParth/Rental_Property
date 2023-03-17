Rails.application.routes.draw do
  resources :buyers
  resources :carts
  resources :properties
  # devise_for :users

  root 'properties#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get '/properties/flat/action', to: 'properties#flat'
  get '/properties/view/action', to: 'properties#show_property'
  get '/carts/cart_destroy/action', to: 'carts#cart_destroy'
  get 'carts/buy/action', to: 'carts#buy'
  get '/properties/property_verfied/action', to: 'properties#property_verfied'
  get '/properties/verfied/action', to: 'properties#verfied'
  get '/properties/destroy_property/action', to: 'properties#destroy_property'
  get '/properties/search/action', to: 'properties#search'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
