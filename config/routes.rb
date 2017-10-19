Rails.application.routes.draw do

  devise_for :users

  root 'searches#show'

  resource  :search, only: %i[show create]
  resources :tickets, only: %i[create show]

  namespace :admin do
    resources :trains do
      resources :wagons, shallow: true
    end

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end

    resources :routes
    resources :tickets

  end

  resource  :search, only: %i[show create]
  resources :tickets, except: %i[edit update]

end
