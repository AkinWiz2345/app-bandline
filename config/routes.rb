Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users do
    member do
      get :likes
    end
  end
  
  resources :articles, only: [:index, :destroy, :show, :edit, :update] do
    collection do
      get :band_new
      post :band_create
      get :member_new
      post :member_create
    end
  end
  
  resources :favorites, only: [:create, :destroy]
end
