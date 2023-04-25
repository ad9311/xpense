class AccountsController < ApplicationController
  def index
    @balance = current_user.account.balance
  end
end
