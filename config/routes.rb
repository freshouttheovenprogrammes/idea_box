Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'

  resources :users do
    resources :ideas
    resources :categories, only: [:index, :show]
  end

  resources :ideas
  resources :categories
  resources :images


  namespace :admin do
    resources :categories
    resources :images, only: [:new]
    resources :users, only: [:show]
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
end
