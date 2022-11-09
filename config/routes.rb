Rails.application.routes.draw do
  root "summary#index"

  resources :single_donations
  resources :match_donations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
