Rails.application.routes.draw do
  root 'home#index'
  resources :tasks
  resources :projects
  resources :teams
  resources :team_members
  resources :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
