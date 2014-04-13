Colaboratory::Application.routes.draw do

  get "static_pages/help",       to: "static_pages#help",       as: :help
  get "static_pages/about",      to: "static_pages#about_us",   as: :about
  get "static_pages/learn_more", to: "static_pages#learn_more", as: :learn_more
  get "static_pages/signup",     to: "static_pages#signup",     as: :signup
  root 'welcome#index'
  get "users/index"
  get "users/show"
  get "users/update"

  # get "/auth/:provider",          to: "sessions#create"
  get "/auth/:provider/callback", to: "sessions#create"

  get "/signout",                 to: "sessions#signout", as: :sign_out


  # resources :contents
  resources :users
end
