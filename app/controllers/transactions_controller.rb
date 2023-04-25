class TransactionsController < ApplicationController
  before_action :set_account, only: %i[create]
  def create
    @transaction = Transaction.new(**transaction_params, account: @account)
    @transaction.save
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
