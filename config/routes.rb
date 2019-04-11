Rails.application.routes.draw do
  root 'customers#new'
 # post 'create', to: 'customers#create'
  resources :customers, only: [:new, :create]
end
