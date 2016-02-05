Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :jobs, only: [:show, :new, :create, :edit, :update]
  resources :companies, only: [:show,:new, :create, :edit, :update]
  resources :categories, only: [:show, :new, :create, :edit, :update]
  resources :contract_types, only: [:show, :new, :create, :edit, :update]

  namespace :api, defaults: { format: 'json' } do
    resources :companies, only: [:show, :index] do
      member do
        get 'jobs'
      end
    end
    resources :categories, only: [:show, :index] do
      member do
        get 'jobs'
      end
    end
    resources :jobs, only: [:show, :index]
  end
end
