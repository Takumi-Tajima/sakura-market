Rails.application.routes.draw do
  devise_for :users
  root 'admins/items#index'
  namespace :admins do
    resources :items, only: %i[index new create edit update destroy]
  end
  devise_for :admins
end
