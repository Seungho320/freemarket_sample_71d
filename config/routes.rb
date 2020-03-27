Rails.application.routes.draw do

  get 'purchase/index'

  get 'purchase/done'

  get 'card/new'

  get 'card/show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
  end

  root 'toppage#index'
  resources :sell, only: [:index, :show, :new, :create]
  resources :users, only: [:show, :new]
    resources :card, only: [:new, :show] do
      collection do
        post 'show', to: 'card#show'
        post 'pay', to: 'card#pay'
        post 'delete', to: 'card#delete'
      end
    end
  
  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end
  
