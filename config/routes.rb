Rails.application.routes.draw do
  root 'accounts#index'

  devise_for :users

  # Accounts
  resources :accounts, only: %i[index]

  # Transactions
  delete 'transactions/destroy_all', to: 'transactions#destroy_all'
  resources :transactions, only: %i[create destroy]
end
