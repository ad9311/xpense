class ExpenseLimitsController < ApplicationController
  before_action :set_cycle
  before_action :set_expense_limit

  def edit; end

  def update
    if @expense_limit.update(expense_limit_params)
      redirect_to edit_cycle_path(@cycle)
    else
      render :edit
    end
  end

  private

  def set_cycle
    @cycle = Cycle.find_by(id: params[:cycle_id])
  end

  def set_expense_limit
    @expense_limit = ExpenseLimit.find_by(id: params[:id])
  end

  def expense_limit_params
    params.require(:expense_limit).permit(:amount)
  end
end
