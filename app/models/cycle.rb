# == Schema Information
#
# Table name: cycles
#
#  id         :bigint           not null, primary key
#  balance    :float            default(0.0), not null
#  month      :integer          not null
#  year       :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
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

  def month_string
    DateTime::MONTHNAMES[month]
  end
end
