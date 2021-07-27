class CreateGroupedExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :grouped_expenses do |t|
      t.integer :group_id
      t.integer :expense_id

      t.timestamps
    end
  end
end
