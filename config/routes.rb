Rails.application.routes.draw do
  root 'welcome#index'

  resources :trains do
    resources :wagons, shallow: true
  end

  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end

  resources :routes
  resource  :search, only: %i[show create]
  resources :tickets
end
