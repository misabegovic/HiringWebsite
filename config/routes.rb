Rails.application.routes.draw do

  root 'public_pages#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :customers, only: [:new, :create]
  resources :companies, only: [:new, :create]
end
