class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @groups = current_user.folders.ordered_alphabetically
  end

  def show
    @expenses = Group.find(params[:id]).expenses.preload(:folders)
  end

  def new
    @group = Group.new
    @icons = Icon.all.ordered_alphabetically
  end

  def edit
    @icons = Icon.all.ordered_alphabetically
  end

  def create
    @icons = Icon.all.ordered_alphabetically
    @group = current_user.folders.build(group_params)

    if @group.save
      redirect_to @group, notice: 'Folder created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Folder updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.expenses.destroy_all
    @group.destroy
    redirect_to groups_url, notice: 'Folder deleted'
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
