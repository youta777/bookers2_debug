Rails.application.routes.draw do
  root "homes#top"
  get "home/about"=>"homes#about"

  devise_for :users

  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
end