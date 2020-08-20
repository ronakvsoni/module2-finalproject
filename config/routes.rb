Rails.application.routes.draw do
  resources :tasks
  resources :projects
  resources :teams
  resources :team_members
  resources :admins
 
  get '/signup', to: 'admins#new', as: 'signup'
  get '/', to: 'sessions#new', as: 'home'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/sessions', to: 'sessions#destroy'

  #get '/colab', to: 'auth#index'
  #root to: "auth#index"

end

