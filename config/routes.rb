Rails.application.routes.draw do
  resources :publishers, only: [:show]
  resources :stores, only: [:update]
end
