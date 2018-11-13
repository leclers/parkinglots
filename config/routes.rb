Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :parkings, only: [:index, :show, :new, :create]
  resources :bookings, only: [:index, :show, :new, :create, :update, :edit]
  resources :parkings, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
