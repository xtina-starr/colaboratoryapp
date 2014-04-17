Colaboratory::Application.routes.draw do

  get "/faq",        to: "static_pages#faq",        as: :faq
  get "/about",      to: "static_pages#about",      as: :about
  get "/learn_more", to: "static_pages#learn_more", as: :learn_more
  get "/signup",     to: "static_pages#signup",     as: :signup
  get "/signin",     to: "static_pages#signin",     as: :signin
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
