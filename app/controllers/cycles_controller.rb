class CyclesController < ApplicationController
  before_action :set_cycle, only: %i[show edit update_expense_limit]

  include Cycles

  def index
    @cycles = current_user.cycles.order(created_at: :desc)
  end

  def show
    @incomes = @cycle.incomes.order(created_at: :desc)
    @expenses = @cycle.expenses.order(created_at: :desc)
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
    @cycle = Cycle.find_by(id: params[:id]) and return unless params.nil?

    current_date = DateTime.now
    @cycle = current_user.cycles.find_by(month: current_date.month, year: current_date.year)
    next_user_cycle(current_user) if @cycle.nil?
  end

  def cycle_params
    params.require(:cycle).permit(:expense_limit)
  end
end
