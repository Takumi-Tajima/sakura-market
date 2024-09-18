Rails.application.routes.draw do
  root 'users/items#index'
  devise_for :users
  scope module: :users do
    resources :items, only: %i[index]
  end
  namespace :admins do
    root 'items#index'
    resources :items, only: %i[index new create edit update destroy]
  end
  devise_for :admins
end
