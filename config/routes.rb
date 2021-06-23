Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/create'
  devise_for :users
  root to: 'pedometers#index'
  resources :pedometers, only: [:index, :new, :create]
  resources :communities do
    resources :messages, only: [:index, :create]
    member do
      post 'add_user'
    end
  end
  resources :users, only: :show
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
end
