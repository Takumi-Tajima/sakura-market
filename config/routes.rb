Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items, only: %i[index show]
  namespace :admins do
    root 'items#index'
    resources :items, only: %i[index show new create edit update destroy] do
      member do
        get :move_higher, to: 'items/positions#move_higher'
        get :move_lower, to: 'items/positions#move_lower'
      end
    end
  end
  devise_for :admins
end
