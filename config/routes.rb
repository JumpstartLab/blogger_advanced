JsbloggerCodemash::Application.routes.draw do
  resources :articles
  resources :comments
  resource  :dashboard

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'dashboard#show'
end
