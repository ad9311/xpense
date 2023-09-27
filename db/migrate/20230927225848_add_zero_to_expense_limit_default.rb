class AddZeroToExpenseLimitDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :expense_limits, :amount, 0.0
  end
end
