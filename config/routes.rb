Rails.application.routes.draw do
  # TODO: テスト用のルーティングなのであとで消す
  root 'hello#index'
  devise_for :admins
end
