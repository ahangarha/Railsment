class GroupsController < ApplicationController
  def index
    return if user_signed_in?

    @page_title = 'Welcome'
    render 'publics/splash'
  end
end
