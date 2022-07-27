Rails.application.routes.draw do  
  post '/signup', to: 'registrations#create'
  get '/signup', to: 'registrations#new'

  get '/about', to: 'about#index'
  root 'main#index'
end
