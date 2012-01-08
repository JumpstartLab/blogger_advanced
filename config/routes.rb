JsbloggerCodemash::Application.routes.draw do
  resources :articles
  resources :comments
  
  match '/' => 'articles#index'
end
