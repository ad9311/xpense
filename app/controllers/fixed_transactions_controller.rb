class FixedTransactionsController < ApplicationController
  def new
    @fixed_transactions = FixedTransaction.new
  end

  def create
    @fixed_transactions = current_user.fixed_transactions.build(fixed_transactions_params)
    if @fixed_transactions.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def fixed_transactions_params
    params.require(:fixed_transaction).permit(:description, :amount, :category)
  end
end
