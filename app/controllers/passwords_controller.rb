class PasswordsController < Devise::PasswordsController
  def new
    @page_title = 'Forgot Password'
    super
  end
end
