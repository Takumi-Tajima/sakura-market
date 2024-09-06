Rails.application.routes.draw do
  namespace :admins do
    resources :items
  end
  devise_for :admins
end
