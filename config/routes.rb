Rails.application.routes.draw do
  devise_for :users

  root to: 'spaces#index'

  get ':reviewable/:reviewable_id/reviews/new', to: 'reviews#new', as: :new_review
  post ':reviewable/:reviewable_id/reviews', to: 'reviews#create', as: :reviews

  resources :spaces do
    resources :favorites, only: [:create]
    resources :bookings, only: [:create]
    collection do
      post 'query', to: 'spaces#index'
    end
  end

  resources :bookings, except: [:create, :edit]

  resources :favorites, only: [:index, :destroy]

end
