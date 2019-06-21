Rails.application.routes.draw do
  resources :invoices
  get 'invoice/index'
  get 'invoice/new/:id', to: 'invoices#new', as: 'invoices_new'

  resources :has_products
  get 'orders/state/:id', to: 'orders#state', as: 'orders_state'
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

  get 'reports/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'orders#index'
end
