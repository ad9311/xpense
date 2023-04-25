class AccountsController < ApplicationController
  before_action :set_account, only: %i[index]
  def index
    @transactions = @account.transactions
    @balance = @account.balance
  end

  private

  def set_account
    @account = current_user.account
  end
end
