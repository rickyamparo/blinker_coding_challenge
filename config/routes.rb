Rails.application.routes.draw do
  root to: 'home#index'

  namespace :api do
    namespace :v1 do
      resources :vehicles
      resources :options
      resources :vehicles_options, only: [:create, :destroy]
    end
  end
end
