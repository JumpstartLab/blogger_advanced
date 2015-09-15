Rails.application.routes.draw do
  resources :articles do
    resources :likes, only: [:create]
    delete 'likes', to: "likes#destroy"
  end
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
