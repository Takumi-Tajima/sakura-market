Rails.application.routes.draw do
  root 'items#index'
  devise_for :users,
             controllers: { registrations: 'users/registrations' }
  resources :items, only: %i[index show]
  resources :cart_items, only: %i[index create destroy]
  namespace :admins do
    root 'items#index'
    resources :items, only: %i[index show new create edit update destroy] do
      member do
        patch :move_higher, to: 'items/positions#move_higher'
        patch :move_lower, to: 'items/positions#move_lower'
      end
    end
    resources :users, only: %i[index]
  end
  devise_for :admins
end
