# == Schema Information
#
# Table name: expense_limits
#
#  id         :bigint           not null, primary key
#  amount     :float            default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cycle_id   :bigint           not null
#
# Indexes
#
#  index_expense_limits_on_cycle_id  (cycle_id)
#
# Foreign Keys
#
#  fk_rails_...  (cycle_id => cycles.id)
#
class ExpenseLimit < ApplicationRecord
  belongs_to :cycle

  validates :amount, numericality: { greater_than_or_equal_to: 0.0 }
end
