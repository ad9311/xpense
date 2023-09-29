class CyclesController < ApplicationController
  before_action :set_cycle, only: %i[edit update_expense_limit]

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

  def update_expense_limit
    if @cycle.update(cycle_params)
      redirect_to cycle_path(@cycle)
    else
      render :edit
    end
  end

  private

  def set_cycle
    @cycle = Cycle.find_by(id: params[:id])
  end

  def cycle_params
    params.require(:cycle).permit(:expense_limit)
  end
end
