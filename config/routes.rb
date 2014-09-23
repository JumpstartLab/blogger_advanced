JsbloggerCodemash::Application.routes.draw do
  match ':status', to: 'errors#show', constraints: {status: /\d{3}/}

  resources :articles
  resources :comments
  resource  :dashboard
  resource  :account, :only => [:show] do
    get :work
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'dashboard#show'
end
