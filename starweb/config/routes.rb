Rails.application.routes.draw do
  resources :has_products
  get 'has_products/index'
  get 'has_products/new'
  post 'has_products/create'
  get 'has_products/edit/:id', to: 'has_products#edit', as: 'has_products_edit'
  patch 'has_products/edit/:id', to: 'has_products#update', as: 'has_products_update'
  get 'has_products/destroy/:id', to: 'has_products#destroy', as: 'has_products_destroy'
  resources :order_details
  resources :info_details
  resources :orders
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
