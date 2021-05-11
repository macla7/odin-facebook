Rails.application.routes.draw do
  resources :posts do
    resources :likes
    resources :comments
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }
  resources :users
  root 'users#index'
  get 'users/:id/request', to: 'users#add_friend', as: 'add_friend'
  get 'users/:id/accept', to: 'users#accept_request', as: 'accept_request'
  get 'users/:id/notifications', to: 'users#notifications', as: 'notifications'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
