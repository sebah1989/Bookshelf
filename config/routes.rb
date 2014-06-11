Rails.application.routes.draw do
  
  resources :bookcases, only: [:show] do
    resources :books do
      member do
        post :add_to_bookshelf
        post :remove_from_bookshelf
      end
    end
  end
  resources :users, only: [:new, :create, :show]
  resources :books
  resources :sessions, only: [:new, :create, :destroy]
  
  post 'sessions/new' => 'sessions#create'
  get 'logout' => 'sessions#delete'
  get 'login' => 'sessions#new'

  root 'books#index'
end
