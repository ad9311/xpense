class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.integer :author_id
      t.string :name
      t.float :amount, precision: 10, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
