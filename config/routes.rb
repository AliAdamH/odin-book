Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :users, only: %i[index show]
  resources :friendship_requests, only: %i[create destroy]
  resources :friendships, only: %i[create]

  resources :likes, only: %i[create destroy]
end
