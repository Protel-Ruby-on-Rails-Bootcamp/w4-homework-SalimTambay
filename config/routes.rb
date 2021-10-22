Rails.application.routes.draw do

  get 'dashboard', to: 'dashboard#index', as: 'dashboard'

  root 'welcome#index'
  devise_for :users

  resources :posts do
    resources :comments do
      patch :accept, on: :member
    end

  end
  
  resources :users do
    get :feed, on: :collection
  end

  resources :relationships, only: [:create, :destroy]
  
end
