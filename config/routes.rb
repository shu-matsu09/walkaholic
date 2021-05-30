Rails.application.routes.draw do
  devise_for :users
  get 'pedometers/index'
  get 'pedometers/new'
  root to: 'pedometers#index'
  resources :pedometers, only: [:index, :new, :create]
end
