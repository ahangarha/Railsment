class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group_id = params[:group_id]
    @user_groups = current_user.groups
    @payment = Payment.new

    @page_title = 'Add new payment'
    @page_back = {
      target: group_path(@group_id)
    }
  end

  def create
    @fallback_group_id = params[:payment][:fallback_group_id]
    payment = Payment.new(params.require(:payment).permit(:name, :amount, :group_ids))
    payment.author = current_user

    groups = Group.find(params[:payment][:group_ids][1..])

    @groups_user_ids = groups.pluck(:user_id).uniq

    if @groups_user_ids == [current_user.id]
      payment.groups = groups

      if payment.save!
        flash[:notice] = 'Payment saved successfully'

        if @fallback_group_id.present?
          redirect_to group_path(@fallback_group_id)
        else
          redirect_to root_path
        end
      else
        redirect_back_or_to groups_path(@fallback_group_id), alert: 'Failed to save the payment!'
      end
    else
      handle_payment_creation_problem
    end
  end

  private

  def payments_params
    params.require(:payment).permit(:name, :amount, :group_id)
  end

  def handle_payment_creation_problem
    if @groups_user_ids.blank?
      redirect_back_or_to groups_path(@fallback_group_id), alert: 'At least one category should be selected!'
    elsif @groups_user_ids.length > 1
      redirect_back_or_to groups_path(@fallback_group_id), alert: 'Invalid group selected!'
    else
      render plain: 'groups not belonging to the logged in user'
    end
  end
end
