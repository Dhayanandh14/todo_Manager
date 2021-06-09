Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  post "users/login", to: "users#login"
  # get "todos/:id", to: "todos#show"
  resources :todos
  resources :users
  get "/", to: "home#index"

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions

end
