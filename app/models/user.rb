# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  balance                :float            default(0.0), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  last_name              :string           not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :cycles, dependent: :destroy
  has_many :incomes, through: :cycles
  has_many :expenses, through: :cycles
  has_many :fixed_incomes, dependent: :destroy
  has_many :fixed_expenses, dependent: :destroy

  after_create :create_cycle

  private

  def create_cycle
    current_date = DateTime.now
    cycles.create(month: current_date.month, year: current_date.year)
  end
end
