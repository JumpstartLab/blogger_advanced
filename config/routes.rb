JsbloggerCodemash::Application.routes.draw do
  resources :articles
  resources :comments
  resource  :dashboard, controller: "dashboard"

  resources :authors

  resources :sessions, only: [ :new, :create, :destroy ]

  match 'login'  => 'sessions#new'
  match 'logout' => 'sessions#destroy'

  root to: 'articles#index'
end
