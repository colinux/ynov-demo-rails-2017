Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"

  resources :restaurants, only: [:show, :new, :create] do
    resources :comments, only: [:create]
  end

  namespace :api_v1 do
    resources :restaurants, only: [:index, :show, :create]
  end

  # la liste des restaurants sera la page d'accueil :
  root to: "restaurants#index"
end
