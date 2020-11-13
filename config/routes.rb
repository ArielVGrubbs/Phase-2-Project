Rails.application.routes.draw do
  resources :posts do
    resources :likes
    resources :comments
  end
  resources :users
  resources :sessions, only: [:new, :create]
  root 'users#new'

  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  get '/logout' => 'sessions#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end