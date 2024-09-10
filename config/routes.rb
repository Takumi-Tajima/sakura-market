Rails.application.routes.draw do
  root 'admins/items#index'
  namespace :admins do
    resources :items
  end
  devise_for :admins
end
