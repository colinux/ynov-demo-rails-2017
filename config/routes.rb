Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  resources :restaurants, only: [:show, :new, :create]

  # la liste des restaurants sera la page d'accueil :
  root to: "restaurants#index"
end
