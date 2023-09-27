Rails.application.routes.draw do
  root 'cycles#show'

  devise_for :users

  resources 'cycles', only: %i[show edit update] do
    resources 'incomes', only: %i[new create]
    resources 'expenses', only: %i[new create]
    resources 'expense_limits', only: %i[edit update]
  end

  resources 'users', only: %i[show]
  resources 'fixed_cash_flows', only: %i[new create]
end
