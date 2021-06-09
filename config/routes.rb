Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  post "users/login", to: "users#login"
  # get "todos/:id", to: "todos#show"
  resources :todos
  resources :users
  get "/", to: "home#index"
end
