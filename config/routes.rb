Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :users

  resources 'dashboard', only: %i[index]
  resources 'cycles' do
    resources 'incomes', only: %i[new create]
    resources 'expenses', only: %i[new create]
  end

  resources 'users', only: %i[show]
  resources 'fixed_cash_flows', only: %i[new create]
end
