JsbloggerCodemash::Application.routes.draw do
  resources :articles
  resources :comments
  resource  :dashboard
  resource  :account, :only => [:show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'dashboard#show'
end
