Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'top#index', as: :authenticated_root
    end
    
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
    
  end
    resources :list, only: %i(new create edit update destroy) do
      resources :card, except: %i(index)
  end
end