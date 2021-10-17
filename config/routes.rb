Rails.application.routes.draw do
  root "sessions#login"
  get "index", to: "articles#index"
  # myindex "articles#myindex"
  get "myindex", to: "articles#myindex"

  get "signup", to: "users#new"
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  get "login", to: "sessions#login"
  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy"
  get "logout", to: "sessions#logout"


  resources :articles do
    resources :comments
  end
end
