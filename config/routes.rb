Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

  get 'comments/new', to: 'comments#new'
  post 'comments/create', to: 'comments#create'

  resources :users
  resources :topics
end
