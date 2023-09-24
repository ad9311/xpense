class CreateFixedIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :fixed_incomes do |t|
      t.text :description, null: false
      t.float :amount, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
