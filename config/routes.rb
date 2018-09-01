Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]

  namespace :teacher do
    resources :students, only: [:index]
  end

  get '/dashboard', to: 'dashboard#index'
end
