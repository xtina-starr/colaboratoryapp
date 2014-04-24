Colaboratory::Application.routes.draw do

  get "/faq",        to: "static_pages#faq",        as: :faq
  get "/about",      to: "static_pages#about",      as: :about
  get "/learn_more", to: "static_pages#learn_more", as: :learn_more
  get "/signup",     to: "static_pages#signup",     as: :signup
  get "/signin",     to: "static_pages#signin",     as: :signin
  root 'welcome#index'
  get "/edit",       to: "users#edit", as: :edit_user
  get "/content/delete/:id", to: "contents#destroy", as: :delete_content
  


  get "profile", to: "users#dashboard", as: :dashboard
  get "/search", to: "contents#search", as: :search
  get "/search/collaborators", to: "contents#collabs", as: :collaboration
  get "/search/feedback", to: "contents#feedback", as: :feedback
  get "/search/latest", to: "contents#latest", as: :latest


  # get "/auth/:provider",          to: "sessions#create"
  get "/auth/:provider/callback", to: "sessions#create"

  get "/signout",                 to: "sessions#signout", as: :sign_out


  # resources :contents
  resources :users
  resources :contents
end
