JsbloggerCodemash::Application.routes.draw do
  resources :articles
  resources :comments
  resource  :dashboard
  
  match '/' => 'dashboard#show'
end
