Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  root to: "projects#index"
  resources :users, only: :show
  resources :projects do
    resources :join_lists, only: [:index, :create, :destroy]
    resources :join_requests, only: [:index, :create, :destroy]
  end
end
