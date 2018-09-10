Rails.application.routes.draw do
  root "pages#root"
  get "players/login", to: "players#login_page"
  post "players/login", to: "players#login"

  mount ActionCable.server => "/cable"

  resources :games, only: [:create, :show, :update]
  resources :players, only: [:create, :show, :update, :edit]
  resources :conversations, only: [:create, :show]
  resources :messages, only: [:create]
end
