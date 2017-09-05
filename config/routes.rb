Rails.application.routes.draw do

  resources :railway_stations do
    patch :update_position, on: :member
  end

  resources :trains do
    resources :wagons, shallow: true
  end

  resources :routes
  resource  :search, only: %i[new show edit]

  get 'welcome/index'
  root 'welcome#index'

end
