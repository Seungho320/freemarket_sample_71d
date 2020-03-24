Rails.application.routes.draw do

  devise_for :users
  root 'toppage#index'
  resources :sell, only: [:new, :create]
  resources :users, only: :show
end