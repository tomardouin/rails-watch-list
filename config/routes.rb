Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "movies", to: "movies#index"

  resources :lists, only: [:index, :new, :create, :show, :destroy] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]

end
