Rails.application.routes.draw do
  devise_for :users,controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'posts#index'
  resources :posts do
    resources :likes, only:[:create, :destroy]
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :comments, only:[:destroy]
  resources :users, only: [:show]
end
