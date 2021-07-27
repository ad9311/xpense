class GroupedExpensesController < ApplicationController
  def add_from_expense
    @grouped_expense = GroupedExpense.create(grouped_expenses_params)
    if @grouped_expense.save
      redirect_to expense_path(params[:expense_id])
    else
      redirect_to root_path
    end
  end

  def delete
    @grouped_expense = GroupedExpense.find_by(grouped_expenses_params)
    if @grouped_expense.destroy
      redirect_to group_path(params[:group_id])
    else
      redirect_to root_path
    end
  end

  private

  def grouped_expenses_params
    params.permit(:group_id, :expense_id)
  end
end
