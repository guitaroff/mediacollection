Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :pictures, only: [:show, :create, :destroy]
  resources :videos, only: [:create, :destroy]
  resources :songs, only: [:create, :destroy]
  root to: "home#index"
end
