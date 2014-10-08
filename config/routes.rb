Rails.application.routes.draw do
  resources :articles
  resources :comments
  resources :api_keys,  only: [:index, :create, :destroy] 
  resource  :account,   only: [:show] do
    get :work
  end

  namespace :api do
    namespace :v1 do
      resources :articles, except: [:new, :edit]
    end
  end

  get  '/login'     => 'sessions#new'
  post '/login'     => 'sessions#create'
  get  '/logout'    => 'sessions#destroy'

  get  '/dashboard' => 'dashboard#show'

  root to: 'articles#index'
end
