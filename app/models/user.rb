class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  validates :name, presence: true

  # Associations
  has_many :expenses, foreign_key: :author_id, class_name: 'Expense', dependent: :destroy
  has_many :folders, class_name: 'Group', foreign_key: 'user_id'

  def total_spent
    expenses.map(&:amount).inject(:+).round(2)
  end
end
