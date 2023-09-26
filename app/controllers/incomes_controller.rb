class IncomesController < ApplicationController
  before_action :set_cycle
  def new
    @income = Income.new
  end

  def create
    @income = @cycle.incomes.build(income_params)
    if @income.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_cycle
    @cycle = Cycle.find_by(id: params[:cycle_id])
  end

  def income_params
    params.require(:income).permit(:description, :amount)
  end
end
