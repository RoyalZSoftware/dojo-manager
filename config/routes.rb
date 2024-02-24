Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :courses
  devise_for :user, controllers: { sessions: 'user/sessions' }

  root to: "courses#index"
end
