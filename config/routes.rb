Rails.application.routes.draw do
  devise_for :users
  namespace :users do
    resources :items
  end
  namespace :admins do
    resources :items, only: %i[index new create edit update destroy]
  end
  devise_for :admins
end
