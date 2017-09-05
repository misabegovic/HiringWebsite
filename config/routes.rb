Rails.application.routes.draw do

  root 'public_pages#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :customers, only: [:new, :create]
  resources :companies, only: [:new, :create]

  namespace :companies do
    resources :candidates, only: [:index, :show]
    resources :profiles, only: [:index, :show, :edit, :update]
    resources :offers, only: [:index, :show]
  end

  namespace :customers do
    resources :candidates, only: [:index, :show]
    resources :profiles, only: [:index, :show, :edit, :update]
    resources :offers, only: [:index, :show]
  end
end
