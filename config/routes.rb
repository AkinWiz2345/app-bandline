Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :create, :new, :edit, :show, :update] do
    member do
      get :likes
    end
  end
  
  resources :articles, only: [:index, :destroy, :show, :edit, :update] do
    member do
      get :band
      get :member
    end
    collection do
      get :band
      get :member
      get :band_new
      post :band_create
      get :member_new
      post :member_create
    end
  end
  
  resources :favorites, only: [:create, :destroy]
  
  resources :messages, only: [:create]
  resources :rooms, only: [:index, :create, :show ]
end
