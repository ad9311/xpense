class RenameFixedTransactionsToFixedTransactions < ActiveRecord::Migration[7.0]
  def change
    rename_table :fixed_cash_flows, :fixed_transactions
  end
end
