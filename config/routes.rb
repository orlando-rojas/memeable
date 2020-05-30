Rails.application.routes.draw do
  devise_for :users
  resources :memes, only: [:show, :new, :create, :edit, :update] do
    resources :votes, only: [:create,:destroy]
    resources :comments, only: [:create]
    resources :tags, only: [:create]
  end
  get '/popular', to: 'popular#index'
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
