Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :users, only: [:edit]
  resources :items, only: [:index, :new]
end
