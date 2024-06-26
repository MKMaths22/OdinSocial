Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  devise_scope :user do
    get 'users/registrations', to: 'users/registrations#index'
    get 'users/registrations/:id', to: 'users/registrations#show'
  end
  # Defines the root path route ("/")
  # devise_scope :user do
  #  root to: 'devise/registrations#new'
  # end
  root "posts#index"
  resources :posts
  resources :comments, except: [:index]
  resources :follow_requests, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :profiles, except: [:index, :new, :destroy, :show]
end
