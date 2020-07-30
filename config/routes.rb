# frozen_string_literal: true

Rails.application.routes.draw do
  post 'admin/login', to: 'admin/sessions#create'
  delete 'admin/logout', to: 'admin/sessions#destroy'

  get 'homepages/home', to: 'homepages#home'
  get 'homepages/menu/food', to: 'homepages#food'
  get 'homepages/menu/drink', to: 'homepages#drink'
  get 'homepages/sale', to: 'homepages#sale'

  get 'user/login', to: 'sessions#new'
  delete 'user/logout', to: 'sessions#destroy'
  get 'user/signup', to: 'users#new'
  get 'admin/signup', to: 'admin/users#new'
  root 'homepages#home'
  namespace :admin do
    get '/', to: 'sessions#new'
  namespace :search do
    resources :categories, only: [:index]
    resources :products , only: [:index]
    end
    resources :categories
    resources :products do
      resources :images, only: %i[index new create destroy]
    end
    resources :users do
      resources :orders, only: %i[index show]
    end
    resources :users
    resources :sessions, only: %i[new create destroy]
  end
  resources :users, except: [:destroy, :index] do
    resources :ratings, only: [:create, :update]
    resources :orders, except: %i[edit update]
  end

  resources :products, only: %i[index show] do
    resources :images, only: %i[index show]
    resources :ratings, only: [:index]
  end
  resources :users, except: %i[index destroy]
  resources :sessions, only: %i[new create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
