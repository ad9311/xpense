class Expense < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: true
  belongs_to :author, class_name: 'User'
  has_many :groups, foreign_key: :group_id, class_name: 'GroupedExpense'
  has_many :folders, through: :groups, source: :expense
end