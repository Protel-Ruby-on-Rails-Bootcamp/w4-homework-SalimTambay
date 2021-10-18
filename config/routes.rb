Rails.application.routes.draw do

  get 'profile/index'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  get 'profile/index/:user_id', to: 'profile#index', as: 'profile'
  root 'welcome#index'
  devise_for :users

  resources :posts do
    resources :comments do
      patch :accept, on: :member
    end

  end
  
  
end
