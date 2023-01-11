Rails.application.routes.draw do
  root to: 'profiles#index'
  get 'profiles/index'
  resources :appointments, only: [:create, :edit, :update]
  resources :doctors, only: [:new, :create, :edit, :update]
  resources :categories, only: [:new, :create, :edit, :update]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
