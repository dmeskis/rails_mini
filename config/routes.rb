Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :students
  end

  namespace :guardian do
    resources :students, only: [:index, :show]
    resources :forms, only: [:index, :show]
    resources :teachers, only: [:index]
  end

  namespace :teacher do
    resources :students, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :forms, only: [:index, :show]
    end
    resources :guardians, only: [:index]
    resources :forms, only: [:index, :edit, :destroy, :show] do
      put :confirm
    end
    get 'relations', to: 'students#add_parent'
    post 'relations_submit', to:'students#create_relation'
  end
  # resources student
  resources :forms, only: [:new, :create]

  get '/forms/select_student', to: 'forms#select_student'
  get '/forms/select_teacher', to: 'forms#select_teacher'

  get '/dashboard', to: 'dashboard#index'
end
