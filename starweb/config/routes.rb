Rails.application.routes.draw do
  resources :products
  resources :supplies
  resources :sponsors
  resources :colors
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
