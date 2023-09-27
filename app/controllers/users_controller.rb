class UsersController < ApplicationController
  def show
    @fixed_cash_flows = current_user.fixed_cash_flows.order(category: :asc)
  end
end
