Rails.application.routes.draw do
  root 'customer#new'
  post '/create', to: 'customer#create'
end
