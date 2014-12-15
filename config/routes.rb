Rails.application.routes.draw do
  resources :tenants, path: "", param: :tenant_slug, except: [:index]

  namespace :tenants, as: :tenant, path: "/:tenant_slug" do
    get  '/login'     => 'sessions#new'
    post '/login'     => 'sessions#create'
    get  '/logout'    => 'sessions#destroy'
    get  '/dashboard' => 'dashboard#show'

    resources :articles
    resources :comments
    resource  :account, only: [:show] do
      get :work
    end
  end

  root to: 'tenants#index'
end
