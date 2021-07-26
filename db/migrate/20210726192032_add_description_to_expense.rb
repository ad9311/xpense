class AddDescriptionToExpense < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :description, :text
  end
end
