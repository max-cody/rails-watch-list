# frozen_string_literal: true

Rails.application.routes.draw do
  get 'lists/index'
  get 'lists/new'
  get 'lists/show'
  get 'bookmarks/index'
  get 'bookmarks/new'
  get 'bookmarks/show'
  get 'list/index'
  get 'list/show'
  get 'list/new'
  get 'bookmark/index'
  get 'bookmark/new'
  get 'bookmark/show'
  get 'movies/index'
  get 'movies/new'
  get 'movies/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  root "lists#index"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create ]
  end
  resources :bookmarks, only: [:destroy]

  #resources :bookmarks, :only: [:new, :create, :destroy]
  # resources :movies do
  #   resources :bookmarks, only: [:new, :create]
  # end
  # resources :lists, only: %i[show destroy]

  # resources :bookmarks, except: %i[edit update]
  # resources :lists, except: %i[edit update]
  #  Defines the root path route ("/")
  #  root "posts#index"


end
