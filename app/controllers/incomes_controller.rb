class IncomesController < ApplicationController
  before_action :set_cycle
  before_action :set_income, only: %i[edit update destroy]

  def new
    @income = Income.new
  end

  def edit; end

  def create
    @income = @cycle.incomes.build(income_params)
    if @income.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @income.update(income_params)
      redirect_to cycle_path(@cycle)
    else
      render :edit
    end
  end

  def destroy
    if @income.destroy
      redirect_to cycle_path(@cycle)
    else
      render :edit
    end
  end

  private

  def set_cycle
    @cycle = Cycle.find_by(id: params[:cycle_id])
  end

  def set_income
    @income = Income.find_by(id: params[:id])
  end

  def income_params
    params.require(:income).permit(:description, :amount)
  end
end
