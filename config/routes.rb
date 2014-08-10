Rails.application.routes.draw do
  root 'static_pages#home'
  match '/about',   to: 'static_pages#about',   via: 'get'
  resources :users
  match '/signup', to: 'users#new',   via: 'get'
end
