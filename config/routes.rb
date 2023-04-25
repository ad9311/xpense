Rails.application.routes.draw do
  root 'accounts#index'
  devise_for :users
  resources :accounts, only: %i[index]
end
