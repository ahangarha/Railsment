class GroupsController < ApplicationController
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
end
