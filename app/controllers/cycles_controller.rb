class CyclesController < ApplicationController
  before_action :set_cycle, only: %i[edit]

  def show
    @current_date = DateTime.now
    @cycle = current_user.cycles.find_by(month: @current_date.month, year: @current_date.year)
    @incomes = @cycle.incomes
    @expenses = @cycle.expenses
    @total_income = @incomes.sum(:amount)
    @total_expenses = @expenses.sum(:amount)
    @expense_limit = @cycle.expense_limit
  end

  def edit
    @expense_limit = @cycle.expense_limit
    @total_income = @cycle.incomes.sum(:amount)
    @total_expenses = @cycle.expenses.sum(:amount)
  end

  def update; end

  private

  def set_cycle
    @cycle = Cycle.find_by(id: params[:id])
  end
end
