# == Schema Information
#
# Table name: transactions
#
#  id          :bigint           not null, primary key
#  category    :integer
#  description :text
#  value       :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :bigint           not null
#
# Indexes
#
#  index_transactions_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Transaction < ApplicationRecord
  belongs_to :account

  before_create :sign_value
  after_create :update_account_balance

  enum category: { expense: 0, income: 1 }

  private

  def sign_value
    self.value = -value if expense?
  end

  def update_account_balance
    balance = account.balance
    account.update(balance: balance + value)
  end
end
