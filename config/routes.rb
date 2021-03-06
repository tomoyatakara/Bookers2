Rails.application.routes.draw do

  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  resources :users, only: [:index,:show, :edit, :update]

  root to: 'users#log'

  get 'home/about' =>'books#about'

  get 'detail' =>'books#detail'
end
