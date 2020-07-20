# frozen_string_literal: true

Rails.application.routes.draw do
  post 'admin/login', to: 'admin/sessions#create'
  delete 'admin/logout', to: 'admin/sessions#destroy'
  get 'homepages/home', to: "homepages#home"
  root 'homepages#home'
  namespace :admin do
    get '/', to: 'sessions#new'
    resources :categories
    resources :products do
      resources :images, only: %i[index new create destroy]
    end
    resources :users do
      resources :orders, only: %i[index show]
    end
    resource :sessions, only: %i[new create destroy]
  end
  resources :users, except: [:destroy] do
    resources :orders, except: %i[edit update]
  end 
  resources :products, only: [:index, :show] do
    resources :images, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
