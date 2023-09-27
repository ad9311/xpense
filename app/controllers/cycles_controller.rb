class CyclesController < ApplicationController
  def show
    @current_date = DateTime.now
    @current_cycle = current_user.cycles.find_by(month: @current_date.month, year: @current_date.year)
    @incomes = @current_cycle.incomes
    @expenses = @current_cycle.expenses
    @total_income = @incomes.sum(:amount)
    @total_expenses = @expenses.sum(:amount)
  end

  def edit; end

  def update; end
end
