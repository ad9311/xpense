class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.float :balance, null: false, default: 0.0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
