Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :users, only: [:create, :show, :edit, :destroy, :update] do
    member do
      get :code
    end
  end
  resources :cloths, except: [:index, :edit, :update]
  resources :categories, only: [:create, :destroy]
  resources :relationship_categories, only: [:create, :destroy]
  resources :temps, except: [:index]
  resources :relationship_temps, only: [:create, :destroy]
end
