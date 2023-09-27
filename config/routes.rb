Rails.application.routes.draw do
  root 'cycles#show'

  devise_for :users

  resources 'cycles', only: %i[show]
  resources 'cycles' do
    resources 'incomes', only: %i[new create]
    resources 'expenses', only: %i[new create]
  end

  resources 'users', only: %i[show]
  resources 'fixed_cash_flows', only: %i[new create]
end
