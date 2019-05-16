Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit/:id', to: 'users#edit', as: 'users_edit'
  patch 'users/edit/:id', to: 'users#update', as: 'users_update'
  get 'users/destroy/:id', to: 'users#destroy', as: 'users_destroy'
  resources :currencies
  resources :quotations
  resources :clients
  resources :products
  resources :supplies
  resources :sponsors
  resources :colors
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
