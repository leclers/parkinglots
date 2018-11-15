Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :parkings  do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :update, :edit]

  get '/test', to: 'pages#test'
end
