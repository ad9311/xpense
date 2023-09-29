# == Schema Information
#
# Table name: expenses
#
#  id          :bigint           not null, primary key
#  amount      :float            not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cycle_id    :bigint           not null
#
# Indexes
#
#  index_expenses_on_cycle_id  (cycle_id)
#
# Foreign Keys
#
#  fk_rails_...  (cycle_id => cycles.id)
#
class Expense < ApplicationRecord
  belongs_to :cycle

  validates :description, length: { maximum: 50, minimum: 1 }
  validates :amount, numericality: { greater_than: 0 }

  after_create :substract_from_cycle_balance
  after_update :update_cycle_balance
  before_destroy :add_to_cycle_balance

  private

  def substract_from_cycle_balance
    current_balance = cycle.balance
    cycle.update(balance: current_balance - amount)
  end

  def update_cycle_balance
    total_incomes = cycle.incomes.sum(:amount)
    total_expenses = cycle.expenses.sum(:amount)
    cycle.update(balance: total_incomes - total_expenses)
  end

  def add_to_cycle_balance
    current_balance = cycle.balance
    cycle.update(balance: current_balance + amount)
  end
end
