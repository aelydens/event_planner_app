require 'rails_helper'

feature 'Authentication' do
  scenario 'Users can sign up and they are automatically logged in' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', with: 'bob@jones.edu'
    fill_name 'Password', with: 'password'
    click_on 'Sign Up'
    expect(page).to have_content('bob@jones.edu')
    expect(page).not_to have_content('Sign Up')
    expect(page).not_to have_content('Sign In')
  end

  scenario 'User can log in' do
    User.create(email: 'mj@jackson5.com', password: 'password')
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: 'mj@jackson5.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign In'
    expect(page).to have_content('Welcome, mj@jackson5.com')
    expect(page).not_to have_content('Sign Up')
    expect(page).not_to have_content('Sign In')
  end
end
