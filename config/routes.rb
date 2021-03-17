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

 post   "favorites/:post_id/create"  => "favorites#create"
 delete "favorites/:post_id/destroy" => "favorites#destroy"
end