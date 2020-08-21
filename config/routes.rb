Rails.application.routes.draw do
  resources :tasks
  resources :projects
  resources :teams
  resources :team_members
  resources :admins
 
  get '/signup', to: 'admins#new', as: 'signup'
  get '/', to: 'sessions#new'
  get '/colab', to: 'sessions#new'
  get '/home', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: 'dashboard'
  delete '/sessions', to: 'sessions#destroy'

  root to: 'sessions#new'

end

