Rails.application.routes.draw do
  devise_for :users
  root to: 'pedometers#index'
  
  resources :pedometers, only: [:index, :new, :create]
end
