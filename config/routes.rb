Rails.application.routes.draw do
  devise_for :users
  root to: "cars#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "mycars" , to: "cars#mycars"
  resources :cars do
    resources :bookings, only: [:index, :new, :create]
  end
  resources :bookings, only: [:destroy]
  resources :bookings, only: [:show]
  get 'account', to: "pages#account"
  patch 'bookings/:id/accept', to: "bookings#accept", as: 'accept'
  patch 'bookings/:id/decline', to: "bookings#decline", as: 'decline'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
