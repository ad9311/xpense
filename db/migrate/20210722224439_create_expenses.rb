class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.integer :author_id
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
