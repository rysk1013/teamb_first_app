Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  root to: "projects#index"
  resources :users, only: :show
  resources :projects, except: :destroy
end
