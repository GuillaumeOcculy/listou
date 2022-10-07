Rails.application.routes.draw do
  resources :product_items
  root "product_lists#index"

  resources :product_lists do
    resources :product_items, except: [:index]
  end

  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    passwords:     "users/passwords",
    registrations: "users/registrations",
    sessions:      "users/sessions",
    unlocks:       "users/unlocks",
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
