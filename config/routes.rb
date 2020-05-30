Rails.application.routes.draw do
  devise_for :users
  resources :memes, only: [:show, :new, :create, :edit, :update]
  get '/account', to: 'account#show'
  resources :memes, only: [:show, :new, :create, :edit, :update] do
    resources :votes, only: [:create,:destroy]
    resources :comments, only: [:create]
    resources :tags, only: [:create]
  end
  get '/popular', to: 'popular#index'
  get '/category', to: 'category#index'
  root to: 'home#index'
  resources :memes, only: [:show, :new, :create] do
    resources :comments, only: [:create, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
