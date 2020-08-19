Rails.application.routes.draw do
  resources :tasks
  resources :projects
  resources :teams
  resources :team_members
  resources :admins

  get '/colab', to: 'auth#index'
  root to: "auth#index"

end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html