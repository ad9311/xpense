class AddExpenseLimitToCycle < ActiveRecord::Migration[7.0]
  def change
    add_column :cycles, :expense_limit, :float, null: false, default: 0.0
  end
end
