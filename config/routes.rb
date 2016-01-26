Rails.application.routes.draw do
  root 'home#index'
  resources :jobs, only: [:show, :new, :create, :edit, :update]
  resources :companies, only: [:new, :create,:show, :edit, :update]
  resources :categories, only: [:show, :new, :create]
  get '/signup' => 'users#new'
  resources :users, only: [:create]
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

end
