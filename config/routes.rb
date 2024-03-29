Rails.application.routes.draw do
  root "product_lists#index"

  resources :product_lists do
    resources :product_items, only: [:create, :edit, :update, :destroy] do
      member do
        patch :complete
        patch :uncomplete
      end
    end
  end

  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    passwords:     "users/passwords",
    registrations: "users/registrations",
    sessions:      "users/sessions",
    unlocks:       "users/unlocks",
  }
end
