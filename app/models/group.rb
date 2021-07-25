class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :icon, presence: { message: 'must be selected' }
  belongs_to :user
  has_many :grouped_expenses, foreign_key: 'group_id', class_name: 'GroupedExpense'
  has_many :expenses, through: :grouped_expenses, class_name: 'Expense'

  scope :ordered_alphabetically, -> { order(name: :asc) }

  def number_of_expenses
    expenses.count
  end
end
