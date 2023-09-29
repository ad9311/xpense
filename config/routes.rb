Rails.application.routes.draw do
  root 'cycles#show'

  devise_for :users

  resources 'cycles', only: %i[show edit update] do
    resources 'incomes', only: %i[new create]
    resources 'expenses', only: %i[new create]
  end

  resources 'users', only: %i[show]
  resources 'fixed_transactions', only: %i[new create]
end
