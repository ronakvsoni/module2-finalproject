Rails.application.routes.draw do
  resources :tasks
  resources :projects
  resources :teams
  resources :team_members
  resources :admins
 
  post '/admins', to: 'admins#create'
  root to: "auth#index"
  # get '/login', to: "admin#new", as: "login"
  # get 'new_admin_path', to: 'admins#new', as: 'signup'
end

