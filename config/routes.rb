Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # resources :users, only [:edit, :index, :show, :update]
  resources :albums, only: [:new, :create, :edit, :index, :show, :update, :destroy]

end
