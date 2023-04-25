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
end
