class FixedTransactionsController < ApplicationController
  before_action :set_fixed_transaction, only: %i[edit update destroy]

  def new
    @fixed_transaction = FixedTransaction.new
  end

  def create
    @fixed_transaction = current_user.fixed_transactions.build(fixed_transactions_params)
    if @fixed_transaction.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @fixed_transaction.update(fixed_transactions_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    if @fixed_transaction.destroy
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def set_fixed_transaction
    @fixed_transaction = FixedTransaction.find_by(id: params[:id])
  end


  def fixed_transactions_params
    params.require(:fixed_transaction).permit(:description, :amount, :category)
  end
end
