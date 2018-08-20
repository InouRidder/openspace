Rails.application.routes.draw do

  devise_for :users
  mount ActionCable.server => "/cable"

  root to: 'pages#home'

  get ':reviewable/:reviewable_id/reviews/new', to: 'reviews#new', as: :new_review
  post ':reviewable/:reviewable_id/reviews', to: 'reviews#create', as: :reviews

  resources :spaces do
    resources :favorites, only: [:create]
    resources :bookings, only: [:create, :new]
    collection do
      post 'query', to: 'spaces#index'
    end
  end

  resources :conversations do
    resources :messages, only: [:create]
  end

  resources :bookings, except: [:create, :edit] do
      member do
        patch 'update_state'
      end
    end

  resources :favorites, only: [:index, :destroy]

end
