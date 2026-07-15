Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  get "users/:username", to: "users#show", as: :user_profile

  resources :posts

  root "home#index"
end
