# == Schema Information
#
# Table name: cycles
#
#  id            :bigint           not null, primary key
#  balance       :float            default(0.0), not null
#  expense_limit :float            default(0.0), not null
#  month         :integer          not null
#  year          :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_cycles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Cycle < ApplicationRecord
  belongs_to :user
  has_many :incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy

  validates :balance, numericality: true
  validates :month, numericality: { greater_than: 0, less_than: 13, only_integer: true }
  validates :year, numericality: { only_integer: true }
  validates :expense_limit, numericality: { greater_than_or_equal_to: 0.0 }

  def month_string
    DateTime::MONTHNAMES[month]
  end

  def month_year_string
    "#{month_string} #{year}"
  end
end
