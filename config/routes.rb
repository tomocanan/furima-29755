Rails.application.routes.draw do
  devise_for :users
  get 'posts', to: 'items#index'
  root to: "items#index"
  resources :users, only: [:edit]
  resources :items, only: [:index, :new, :create]
end
