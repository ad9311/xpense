class UsersController < ApplicationController
  def show
    @cycles = current_user.cycles.order(created_at: :desc).limit(6)
    @fixed_transactionss = current_user.fixed_transactions.order(category: :asc)
  end
end
