require 'rails_helper'

def login_as(name, password)
  visit new_user_session_path
  fill_in 'Email', with: name
  fill_in 'Password', with: password
  click_button 'Log in'
end

RSpec.describe 'Payment', type: :feature do
  before :each do
    User.create!(name: 'Mostafa', email: 'mostafa@rails.com', password: '123456')
    Group.create!(user: User.last, name: 'Bills', icon: 'some_image_url')

    login_as('mostafa@rails.com', '123456')
  end

  context 'before adding any payment' do
    it 'it shows 0 amount' do
      visit root_path
      expect(page).to have_link('Bills')
    end
  end

  context 'after adding a new group' do
    it 'shows the group in the home page' do
      visit group_path(Group.last)
      click_link 'Add a new payment'
      fill_in 'Name', with: 'Gas'
      fill_in 'Amount', with: 2.3

      click_button 'Save'

      expect(page).to have_current_path(group_path(Group.last))
      expect(page).to have_content("Bills\n$2.3")
      expect(page).to have_content("Gas\n$2.3")
    end
  end
end
