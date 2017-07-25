Rails.application.routes.draw do
  resources :railway_stations
  resources :train
  resources :routes

  get 'welcome/index'

  root 'welcome#index'
end
