Colaboratory::Application.routes.draw do

  root 'welcome#index'
  get "users/index"
  get "users/show"
  get "users/update"

  get "profile", to: "users#user_profile", as: :user_profile
  get "/search", to: "contents#search", as: :search

  # get "/auth/:provider",          to: "sessions#create"
  get "/auth/:provider/callback", to: "sessions#create"

  get "/signout",                 to: "sessions#signout", as: :sign_out


  # resources :contents
  resources :users
  resources :contents
end
