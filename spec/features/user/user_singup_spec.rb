require 'rails_helper'

feature 'User is created' do
  scenario 'succefully' do
    user = new_user

    visit root_path
    click_on 'Registrar-se'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'Unsuccessfully' do
    user = new_user
    visit root_path
    click_on 'Registrar-se'

    fill_in 'Email', with: ''
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Sign up'

    expect(page).to have_content "Email can\'t be blank"
  end

  scenario ', logged in and logged out successfully' do
    user = User.create!(email: 'dev.joaogustavo@gmail.com',
                        password: '12345678',
                        password_confirmation: '12345678')
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'

    click_on 'Sair'
    expect(page).to have_content 'Signed out successfully.'
  end
end
