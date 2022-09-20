Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "articles#index"
  # resources :articles
  get "articles", to: "articles#index"
  # get "articles/:id", to: "articles#show", as: :article
  get "articles/:id", to: "articles#show", as: :show_post

  get "new", to: "articles#new"
  # post "articles", to: "articles#create"
  post "new", to: "articles#create", as: :create_post

  get "edit/:id", to: "articles#edit", as: :edit_post
  patch "edit/:id", to: "articles#update", as: :update_post

  delete "delete/:id", to: "articles#delete", as: :delete_post

  post "comment/:id", to: "comments#create", as: :create_comment
end
