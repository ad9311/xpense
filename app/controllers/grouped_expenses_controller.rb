class GroupedExpensesController < ApplicationController
  def create
    @params = grouped_expenses_params
    @grouped_expense = GroupedExpense.create(grouped_expenses_params)
    if @grouped_expense.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def grouped_expenses_params
    params.permit(:group_id, :expense_id)
  end
end
