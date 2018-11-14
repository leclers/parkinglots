Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :parkings, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :update, :edit]

  get '/about', to: 'pages#about'
end
