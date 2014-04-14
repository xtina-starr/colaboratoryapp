Colaboratory::Application.routes.draw do

  get "/help",       to: "static_pages#help",       as: :help
  get "/about",      to: "static_pages#about_us",   as: :about
  get "/learn_more", to: "static_pages#learn_more", as: :learn_more
  get "/signup",     to: "static_pages#signup",     as: :signup
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
