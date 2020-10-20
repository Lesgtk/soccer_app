Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'static_pages#home'
  get 'search', to: 'static_pages#search'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/posts', to: 'posts#new'
  get '/posts/:id', to: 'posts#show'
  get '/static_pages/likes', to: 'static_pages#likes'
  get 'users/:id/likes', to: 'users#likes'
  post '/guest_sign_in', to: 'sessions#new_guest'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resource :likes, only: [:create, :destroy]
    resources :comments, only: %i[create destroy]
  end

  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :posts, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
end
