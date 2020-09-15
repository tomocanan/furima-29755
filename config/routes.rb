Rails.application.routes.draw do
  devise_for :users
  get 'posts', to: 'items#index'
  root to: "items#index"
  get 'items/:id', to: 'items#set'


  resources :users, only: [:edit]
  resources :items, only: [:index, :new, :create, :update]
end
