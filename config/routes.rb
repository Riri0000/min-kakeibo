Rails.application.routes.draw do
  root to: 'static_pages#top'

  # ログイン・ログアウト
  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
  get 'login', to: 'user_sessions#new', as: :login
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy', as: :logout

  resources :users, only: %i[new create edit]
  resources :user_profiles, only: %i[new create show]
  resources :account_books do
    collection do
      get :mypage, to: 'account_books#mypage'
    end
  end
end
