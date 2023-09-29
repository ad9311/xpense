class CreateExpenseLimits < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_limits do |t|
      t.float :amount, null: false
      t.references :cycle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
