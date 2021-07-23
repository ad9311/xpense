class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, presence: true

  # Associations
  has_many :expenses, foreign_key: :author_id, class_name: 'Expense', dependent: :destroy

  def total_spent
    self.expenses.sum(:amount)
  end
end
