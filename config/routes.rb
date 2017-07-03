Rails.application.routes.draw do

  root  'welcome#index'

  resources :users
  resources :sessions
  resources :welcome
  resources :tweets
  resources :followings

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'follow' => 'followings#new'
  post 'follow' => 'followings#create'
  delete 'unfollow' => 'followings#destroy'
  get 'register' => 'users#new'
  post 'users/find' => 'users#find', as: 'find_users'
end
