class FixedCashFlowsController < ApplicationController
  def new
    @fixed_cash_flow = FixedCashFlow.new
  end

  def create
    @fixed_cash_flow = current_user.fixed_cash_flows.build(fixed_cash_flows_params)
    if @fixed_cash_flow.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def fixed_cash_flows_params
    params.require(:fixed_cash_flow).permit(:description, :amount, :category)
  end
end
