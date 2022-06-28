Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:index, :show, :new, :create]
  resources :payments, only: [:new, :create] 

  # Defines the root path route ("/")
  root "groups#index"
end
