Rails.application.routes.draw do
  root to: 'static_pages#top'
  resources :dashboards, only: %i[show]

  # ログイン・ログアウト
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  resources :users, only: %i[new create edit destroy]
  resources :user_profiles, only: %i[new create edit update destroy]
  resources :account_books do
    collection do
      get :likes
    end
  end
  resources :likes, only: %i[create destroy]
end
