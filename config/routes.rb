Rails.application.routes.draw do
  post '/signup', to: 'registrations#create'
  get '/signup', to: 'registrations#new'

  get 'password', to: 'passwords#edit'
  patch 'password', to: 'passwords#update'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'

  get '/about', to: 'about#index'
  root 'main#index'
end
