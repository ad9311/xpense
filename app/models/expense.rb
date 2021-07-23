class Expense < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :amount, presence: true, numericality: true
  belongs_to :author, class_name: 'User'
end
