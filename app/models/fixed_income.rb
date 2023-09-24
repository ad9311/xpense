# == Schema Information
#
# Table name: fixed_incomes
#
#  id          :bigint           not null, primary key
#  amount      :float            not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_fixed_incomes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class FixedIncome < ApplicationRecord
  belongs_to :user
end
