Rails.application.routes.draw do

  root 'public_pages#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :public_pages, only: [:index]
end
