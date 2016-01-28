Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :jobs, only: [:show, :new, :create, :edit, :update]
  resources :companies, only: [:new, :create,:show, :edit, :update]
  resources :categories, only: [:show, :new, :create]
  get '/signup' => 'users#new'
  resources :users, only: [:create]
end
