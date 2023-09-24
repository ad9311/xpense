class CreateCycles < ActiveRecord::Migration[7.0]
  def change
    create_table :cycles do |t|
      t.date :date, null: false
      t.references :user, null: false, foreign_key: true
      t.float :balance, null: false, default: 0.0

      t.timestamps
    end
  end
end
