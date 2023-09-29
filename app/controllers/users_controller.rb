class UsersController < ApplicationController
  def show
    @fixed_transactionss = current_user.fixed_transactions.order(category: :asc)
  end
end
