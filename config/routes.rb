Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "movies#index"

  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end

  delete "bookmarks/:id", to: "bookmarks#destroy"
  delete "lists/:id", to: "lists#destroy"
end
