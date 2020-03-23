Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'toppage#index'
  resources :sell, only: :new
  resources :users, only: :show
end
