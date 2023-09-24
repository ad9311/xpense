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
end
