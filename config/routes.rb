Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "properties#index"
  resources :properties, only: [:index, :show]
  namespace :admin do
    resources :properties
  end
  get "dashboard", to: "dashboard#index"
end
