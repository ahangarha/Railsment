require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  before :each do
    User.create(name: 'Mostafa', email: 'mostafa@rails.com', password: '123456')
  end

  it 'gets splash screen without login' do
    visit root_path
    expect(page).to have_content('Welcome')
    expect(page).to have_link('Login')
    expect(page).to have_link('Register')
  end

  it 'redirects to categories page after login' do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'mostafa@rails.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    expect(page).to have_content('Categories')
    expect(page).to have_content('Total Amount')
  end
end
