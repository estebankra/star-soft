Rails.application.routes.draw do
  mount ReportsKit::Engine, at: '/'

  resources :reports, only: [:index]
  resources :has_products
  resources :has_sponsors
  get 'orders/state/:id', to: 'orders#state', as: 'orders_state'
  resources :order_details
  resources :info_details
  resources :orders
  get 'users/index'
  get 'users/edit/:id', to: 'users#edit', as: 'users_edit'
  patch 'users/edit/:id', to: 'users#update', as: 'users_update'
  get 'users/destroy/:id', to: 'users#destroy', as: 'users_destroy'
  get 'orders/invoice/:id', to: 'orders#invoice'
  get 'orders/half/:id', to: 'orders#half'
  get 'orders/pay/:id', to: 'orders#pay'
  resources :currencies, except: [:show]
  resources :quotations
  resources :clients
  resources :products
  resources :supplies
  resources :sponsors
  resources :colors
  devise_for :users
  resources :users, only: [:index]
  resources :invoices, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'orders#index'
end
