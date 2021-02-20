Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:create, :show, :edit, :destroy] do
    member do
      get :code
    end
  end
  resources :cloths, except: [:index]
  resources :categories, only: [:create, :destroy]
  resources :relationship_categories, only: [:create, :destroy]
  resources :temps, except: [:index, :show]
end
