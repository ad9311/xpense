# == Schema Information
#
# Table name: fixed_transactions
#
#  id          :bigint           not null, primary key
#  amount      :float            not null
#  category    :integer          default("income"), not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_fixed_transactions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class FixedTransaction < ApplicationRecord
  belongs_to :user

  validates :description, length: { maximum: 50, minimum: 1 }
  validates :category, presence: true
  validates :amount, numericality: { greater_than: 0 }

  enum category: { income: 0, expense: 1 }
end
