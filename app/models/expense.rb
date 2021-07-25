class Expense < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: true

  belongs_to :author, class_name: 'User'
  has_many :groups, foreign_key: :expense_id, class_name: 'GroupedExpense'
  has_many :folders, through: :groups, source: :group

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def my_author
    user = User.find_by(id: author_id)
    user.name
  end

  def not_in_group
    groups = Group.where(user_id: author_id)
    groups.where.not(id: folders)
  end

  def self.grouped
    grouped_expenses = GroupedExpense.includes(:expenses).select('expense_id as id')
    where(id: grouped_expenses).ordered_by_most_recent
  end

  def self.ungrouped
    grouped_expenses = GroupedExpense.includes(:expenses).select('expense_id as id')
    where.not(id: grouped_expenses).ordered_by_most_recent
  end
end
