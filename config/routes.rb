Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items, only: %i[index show]
  namespace :admins do
    root 'items#index'
    resources :items, only: %i[index new create edit update destroy]
  end
  devise_for :admins
end
