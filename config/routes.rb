Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  unauthenticated :user do
    devise_scope :user do
      root to: 'devise/sessions#new'
    end
  end
  
  authenticated :user do
    root to: 'organizations#index', as: :authenticated_root
    resources :organizations, except: [:new, :create]

    namespace :api do
      resources :organizations, only: :create
    end
  end

end
