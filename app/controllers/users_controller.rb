class UsersController < ApplicationController
  def show
    @fixed_cash_flows = current_user.fixed_cash_flows
    @fixed_incomes = @fixed_cash_flows.income
    @fixed_expenses = @fixed_cash_flows.expense
  end
end
