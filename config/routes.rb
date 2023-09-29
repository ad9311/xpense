Rails.application.routes.draw do
  root 'cycles#show'

  devise_for :users

  resources 'cycles', only: %i[show edit] do
    resources 'incomes', only: %i[new create edit update destroy]
    resources 'expenses', only: %i[new create edit update destroy]
  end
  patch 'cycles/:id/edit_expense_limit', to: 'cycles#update_expense_limit'


  resources 'users', only: %i[show]
  resources 'fixed_transactions', only: %i[new create]
end
