class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  belongs_to :user
  has_many :grouped_expenses, foreign_key: 'group_id', class_name: 'GroupedExpense'
  has_many :expenses, through: :grouped_expenses, class_name: 'Expense'

  scope :ordered_alphabetically, -> { order(name: :asc) }
end
