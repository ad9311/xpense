class DashboardController < ApplicationController
  def index
    @current_date = DateTime.now
    @current_cycle = current_user.cycles.find_by(month: @current_date.month, year: @current_date.year)
    @incomes = @current_cycle.incomes
    @expenses = @current_cycle.expenses
  end
end
