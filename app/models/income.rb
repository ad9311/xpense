# == Schema Information
#
# Table name: incomes
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
#  index_incomes_on_cycle_id  (cycle_id)
#
# Foreign Keys
#
#  fk_rails_...  (cycle_id => cycles.id)
#
class Income < ApplicationRecord
  belongs_to :cycle
end
