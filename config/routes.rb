Rails.application.routes.draw do
  root 'admins/items#index'
  namespace :admins do
    resources :items, only: %i[index new create edit update destory]
  end
  devise_for :admins
end
