Rails.application.routes.draw do

  # post 'purchase/show'

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
  resources :sell, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :purchase, only: [:show] do
      collection do
        get 'show', to: 'purchase#show'
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end

  resources :users, only: [:show, :new] do
      collection do
        get 'item_status', to:'users#item_status'
      end
  end

  resources :users, only: [:show, :new]
    resources :card, only: [:new, :show] do
      collection do
        post 'show', to: 'card#show'
        post 'pay', to: 'card#pay'
        post 'delete', to: 'card#delete'
      end
    end

end
  
