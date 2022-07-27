Rails.application.routes.draw do
  get '/about', to: 'about#index'

  post '/signup', to: 'registrations#create'
  get '/signup', to: 'registrations#new'

  get 'password', to: 'passwords#edit'
  patch 'password', to: 'passwords#update'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'

  get 'password/reset', to: 'password_resets#new', as: :password_reset
  post 'password/reset/send', to: 'password_resets#reset_send', as: :password_reset_send
  get 'password/reset/edit', to: 'password_resets#edit', as: :password_reset_edit
  patch 'password/reset/update', to: 'password_resets#update', as: :password_reset_update

  root 'main#index'
end
