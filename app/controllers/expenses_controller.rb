class ExpensesController < ApplicationController
  before_action :set_cycle
  before_action :set_expense, only: %i[edit update destroy]

  def new
    @expense = Expense.new
  end

  def edit; end

  def create
    @expense = @cycle.expenses.build(expense_params)
    if @expense.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to cycle_path(@cycle)
    else
      render :edit
    end
  end

  def destroy
    if @expense.destroy
      redirect_to cycle_path(@cycle)
    else
      render :edit
    end
  end

  private

  def set_cycle
    @cycle = Cycle.find_by(id: params[:cycle_id])
  end

  def set_expense
    @expense = Expense.find_by(id: params[:id])
  end

  def expense_params
    params.require(:expense).permit(:description, :amount)
  end
end
