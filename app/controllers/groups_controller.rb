class GroupsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @page_title = 'Categories'
      @groups = Group.includes(:payments).where(user: current_user)
      @total = Payment.where(author: current_user).sum(&:amount)
    else
      @page_title = 'Welcome'
      render 'publics/splash'
    end
  end

  def show
    @group = Group.includes(:payments).find(params[:id])
    @page_title = @group.name
    @page_back = {
      target: root_path
    }
  end

  def new
    @group = Group.new
    @page_title = 'Add new group'
    @page_back = {
      target: root_path
    }
  end

  def create
    group = Group.new(groups_params)
    group.user = current_user

    if group.save!
      redirect_to root_path, notice: 'New category added'
    else
      redirect_to new_group_path, alert: 'Failed to save!'
    end
  end

  private

  def groups_params
    params.require(:group).permit(:name, :icon)
  end
end
