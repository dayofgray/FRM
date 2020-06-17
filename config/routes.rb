Rails.application.routes.draw do
  resources :users, :except => [:new, :create] do
    resources :events, :only => [:index, :show, :create]
  end

  resources :friends, :except => [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'
  
  #Signup Routes
  get '/signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'


  # Login and Logout Routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')


end
