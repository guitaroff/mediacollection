Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :pictures, only: [:show, :new, :create, :destroy]
  root to: "home#index"
end
