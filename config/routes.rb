Rails.application.routes.draw do

  devise_for :users
  root 'toppage#index'
  resources :sell, only: :new
  resources :users, only: [:show, :new]
end
