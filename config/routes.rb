Rails.application.routes.draw do

  resources :posts do 
    resources :comments, only: %i[create]
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do 
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticated :user do
      root to: 'posts#index', as: :authenticated_root
    end
  end
  # root to: 'posts#index'
  resources :users, only: %i[index show edit update]
  resources :friendship_requests, only: %i[create destroy]
  resources :friendships, only: %i[create]

  resources :likes, only: %i[create destroy]
end
