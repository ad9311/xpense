class TransactionsController < ApplicationController
  before_action :set_account, only: %i[create destroy_all]
  def create
    @transaction = Transaction.new(**transaction_params, account: @account)
    @transaction.save
    redirect_to root_path
  end

  def destroy_all
    @account.transactions.destroy_all
    @account.update(balance: 0.0)
    redirect_to root_path
  end

  private

  def set_account
    @account = current_user.account
  end

  def transaction_params
    params.require(:transaction).permit(:description, :value, :category)
  end
end
