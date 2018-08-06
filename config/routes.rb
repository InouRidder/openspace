Rails.application.routes.draw do
  devise_for :users

  root to: 'spaces#index'

  resources :spaces do
    resources :favorites, only: [:create]
    resources :bookings, only: [:create]
    collection do
      post 'query', to: 'spaces#index'
    end
  end

  resources :bookings, except: [:create, :update, :edit]
  resources :favorites, only: [:index, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
