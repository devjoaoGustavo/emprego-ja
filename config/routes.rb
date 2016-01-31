Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :jobs, only: [:show, :new, :create, :edit, :update]
  resources :companies, only: [:show,:new, :create, :edit, :update]
  resources :categories, only: [:show, :new, :create]
  resources :contract_types, only: [:show]
end
