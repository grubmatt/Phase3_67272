Rails.application.routes.draw do
  # Routes for main resources go here
  resources :assignments
  resources :stores
  resources :employees

  # Semi-static page routes go here
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  

  # Set the root url here
  root 'home#index'
  
end
