Rails.application.routes.draw do
  root 'static_pages#home'
  
  get :about,        to: 'static_pages#about'
  get :use_of_terms, to: 'static_pages#terms'
  get :signup,       to: 'users#new'

  resources :users do
    member do
      get :following, :followers
    end
  end
  get  :login,        to: 'sessions#new'
  post :login,        to: 'sessions#create'
  delete :logout,     to: 'sessions#destroy'
  
  resources :posts
  
  resources :relationships, only: [:create, :destroy]

  get :favorites, to: 'favorites#index'
  post   "favorites/:post_id/create"  => "favorites#create"
  delete "favorites/:post_id/destroy" => "favorites#destroy"

  resources :comments, only: [:create, :destroy]

  resources :notifications, only: :index

  post 'guest_login', to: "guest_sessions#create"

end