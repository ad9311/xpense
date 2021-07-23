class Expense < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: true

  belongs_to :author, class_name: 'User'
  has_many :groups, foreign_key: :expense_id, class_name: 'GroupedExpense'
  has_many :folders, through: :groups, source: :group

  def not_in_group
    groups = Group.all
    groups.where.not(id: self.folders)
  end
  
  def self.grouped
    grouped_expenses = GroupedExpense.select('expense_id as id')
    self.where(id: grouped_expenses)
  end

  def self.ungrouped
    grouped_expenses = GroupedExpense.select('expense_id as id')
    self.where.not(id: grouped_expenses)
  end
end
