Rails.application.routes.draw do

  root  'welcome#index'

  resources :users
  resources :sessions
  resources :welcome

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'register' => 'users#new'
end
