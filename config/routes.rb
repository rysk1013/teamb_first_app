Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root to: "projects#index"
  resources :users, only: :show
  resources :projects, except: :destroy do
    resources :join_lists, only: [:index, :create, :destroy]
    resources :join_requests, only: [:index, :create, :destroy]
  end
end
