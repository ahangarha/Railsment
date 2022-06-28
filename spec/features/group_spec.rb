require 'rails_helper'

def login_as(name, password)
  visit new_user_session_path
  fill_in 'Email', with: name
  fill_in 'Password', with: password
  click_button 'Log in'
end

RSpec.describe 'Group', type: :feature do
  before :each do
    User.create(name: 'Mostafa', email: 'mostafa@rails.com', password: '123456')
    login_as('mostafa@rails.com', '123456')
  end

  context 'before adding any group' do
    it 'it shows no items in the home page' do
      expect(page).to have_content('Categories')
      expect(page).to have_content("Total Amount\n$0")
      expect(page).to have_link('Add a new category')
      expect(page).to have_content("You don't have any category yet!")
    end
  end

  context 'after adding a new group' do
    it 'shows the group in the home page' do
      visit new_group_path
      fill_in 'Name', with: 'Bills'
      fill_in 'Icon', with: 'some_image_url'
      click_button 'Save'

      expect(page).to have_content('Bills')
    end

    it 'shows detail of the group by clicking on it' do
      visit new_group_path
      fill_in 'Name', with: 'Bills'
      fill_in 'Icon', with: 'some_image_url'
      click_button 'Save'

      click_link 'Bills'

      expect(page).to have_current_path(group_path(Group.last.id))
      expect(page).to have_content("Bills\n$0")
    end
  end
end
