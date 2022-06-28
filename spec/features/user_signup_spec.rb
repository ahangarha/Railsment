require 'rails_helper'

RSpec.describe 'User Signup', type: :feature do
  it 'redirects to categories list after registration' do
    visit root_path
    click_link 'Register'
    fill_in 'Name', with: 'Mostafa'
    fill_in 'Email', with: 'mostafa@rails.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_button 'Sign up'

    expect(page).to have_content('Categories')
    expect(page).to have_content('Total Amount')
  end
end
