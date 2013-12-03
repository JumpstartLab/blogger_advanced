JsbloggerCodemash::Application.routes.draw do
  scope ':username' do
    resources :articles, :only => [:show, :index]

    namespace :admin do
      resources :articles, :except => [:show, :index]
    end
    #resources :articles, :except => [:show, :index], :to => "admin/articles"
  end
  
  resources :comments
  resource  :dashboard
  resource  :account, :only => [:show]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  root to: 'dashboard#show'
end

#scope ':user'
