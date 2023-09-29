class DropExpenseLimit < ActiveRecord::Migration[7.0]
  def up
    drop_table :expense_limits
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
