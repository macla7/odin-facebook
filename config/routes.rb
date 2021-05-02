Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions' }
  resources :users
  root 'users#index'
  get 'users/:id/request', to: 'users#add_friend', as: 'add_friend'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
