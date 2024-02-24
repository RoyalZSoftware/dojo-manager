Rails.application.routes.draw do
  get 'progression/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :courses
  resources :progression, only: [:index]
  devise_for :user, controllers: { sessions: 'user/sessions' }

  root to: "progression#index"
end
