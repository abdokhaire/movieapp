Rails.application.routes.draw do
  get 'pages/index'
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :movies, param: :slug
      resources :reviews, only: [:create, :destroy]
    end
  end
  
  get 'search', to: 'search#search'
  get '*path', to: 'pages#index', via: :all
end
