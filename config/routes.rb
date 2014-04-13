Colaboratory::Application.routes.draw do

  get "static_pages/help"
  get "static_pages/about_us"
  get "static_pages/learn_more"
  root 'welcome#index'
  get "users/index"
  get "users/show"
  get "users/update"

  get "welcome/index"

  # get "/auth/:provider",          to: "sessions#create"
  get "/auth/:provider/callback", to: "sessions#create"

  get "/signout",                 to: "sessions#signout", as: :sign_out


  # resources :contents
  resources :users
end
