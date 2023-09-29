class CreateFixedTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :fixed_cash_flows do |t|
      t.text :description, null: false
      t.float :amount, null: false
      t.integer :category, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
