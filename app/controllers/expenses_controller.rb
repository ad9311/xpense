class ExpensesController < ApplicationController
  before_action :set_cycle
  def new
    @expense = Expense.new
  end

  def create
    @expense = @cycle.expenses.build(expense_params)
    if @expense.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_cycle
    @cycle = Cycle.find_by(id: params[:cycle_id])
  end

  def expense_params
    params.require(:expense).permit(:description, :amount)
  end
end
