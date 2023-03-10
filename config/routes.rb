Rails.application.routes.draw do
  resources :buyers
  resources :carts
  resources :properties
  #devise_for :users
  get 'welcome/index'
  root 'welcome#index'
   get 'welcome/map' , to: 'welcome#map'
   devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '/properties/card/action' ,to: "properties#card"
  get '/properties/flat/action' ,to: "properties#flat"
  get '/properties/view/action' ,to: "properties#viewpage"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
 