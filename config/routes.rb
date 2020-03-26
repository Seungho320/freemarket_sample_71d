Rails.application.routes.draw do

  get 'card/new'

  get 'card/show'

  devise_for :users
  root 'toppage#index'
  resources :sell, only: :new
  resources :users, only: :show
    resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
