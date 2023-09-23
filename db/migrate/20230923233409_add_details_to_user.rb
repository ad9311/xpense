class AddDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :balance, :float, null: false, default: 0.0
  end
end
