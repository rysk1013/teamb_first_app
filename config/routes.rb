Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  root to: "projects#index"
  resources :users, only: :show
  resources :projects do
    collection do
      get "projectsList"
      get "projectsJoining"
    end
    resources :join_lists, only: [:index, :create, :destroy, :show]
    resources :join_requests, only: [:index, :create, :destroy, :show]
  end
end
