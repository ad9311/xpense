class TransactionsController < ApplicationController
  before_action :set_account, only: %i[create destroy destroy_all]
  before_action :set_transaction, only: %i[destroy]

  def create
    @transaction = Transaction.new(**transaction_params, account: @account)
    @transaction.save
    redirect_to root_path
  end

  def destroy
    @transaction.destroy
    redirect_to root_path
  end

  def destroy_all
    @account.transactions.destroy_all
    redirect_to root_path
  end

  private

  def set_account
    @account = current_user.account
  end

  def set_transaction
    @transaction = Transaction.find_by(id: params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:description, :value, :category)
  end
end
