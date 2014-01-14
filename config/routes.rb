JsbloggerCodemash::Application.routes.draw do
  resources :reviews

  namespace :api do
    namespace :v1 do
      resources :articles, :only => [:index, :show, :create, :update, :destroy] do
        collection do
          get :count
        end

        member do
          get :with_comments
        end
      end
      resources :comments
    end

    namespace :v2 do
      resources :articles
    end
  end

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
