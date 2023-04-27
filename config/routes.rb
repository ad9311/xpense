Rails.application.routes.draw do
  root 'accounts#index'

  devise_for :users

  resources :accounts, only: %i[index]
  resources :transactions, only: %i[create]
  delete 'transactions/destroy_all', to: 'transactions#destroy_all'
end
