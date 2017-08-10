Rails.application.routes.draw do
  resources :railway_stations
  resources :trains
  resources :wagons
  resources :routes

  get 'welcome/index'

  root 'welcome#index'
end
