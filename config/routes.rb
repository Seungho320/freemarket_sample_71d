Rails.application.routes.draw do

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
  
  resources :sell, only: [:index, :show, :new, :create, :edit, :update]

  resources :users, only: [:show, :new] do
    collection do
      get 'item_status', to:'users#item_status'
    end
  end

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
  
