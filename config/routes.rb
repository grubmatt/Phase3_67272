Rails.application.routes.draw do
  # Routes for main resources go here
  resources :assignments
  resources :stores
  resources :employees

  # Semi-static page routes go here

  
  # Set the root url here
  root to: 'assignments#index', as: :home
  
end
