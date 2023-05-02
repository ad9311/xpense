class AccountsController < ApplicationController
  before_action :set_account, only: %i[index]
  def index
    start_date = Time.zone.now.beginning_of_month
    end_date = Time.zone.now
    @transactions = @account.transactions.where(created_at: start_date..end_date).order(created_at: :desc)
    @total_income = @transactions.where('value > ?', 0).sum(:value)
    @total_expenses = @transactions.where('value < ?', 0).sum(:value)
    @balance = @account.balance
  end

  private

  def set_account
    @account = current_user.account
  end
end
