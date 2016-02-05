require 'rails_helper'

feature 'User edits' do
  scenario ' their own companies Successfully' do
    user = user_signup

    Company.create!(name: 'Locaweb',
                    location: 'São Paulo',
                    email: 'loc@web.com.br',
                    phone: '(11)4854-4684',
                    user: user)

    user_signin user.email, user.password

    click_on 'Locaweb'
    click_on 'Editar'
    fill_in 'Name', with: 'Tray'

    fill_in 'Email', with: 'tray@locaweb.com.br'
    click_on 'Salvar Alterações'

    expect(page).to have_content 'Company was successfully updated'
    expect(page).to have_content 'Tray'
    expect(page).to have_content 'tray@locaweb.com.br'
  end

  scenario ' their own companies Unsuccessfully' do
    user = user_signup

    Company.create!(name: 'Locaweb',
                    location: 'São Paulo',
                    email: 'loc@web.com.br',
                    phone: '(11)4854-4684',
                    user: user)

    user_signin user.email, user.password

    click_on 'Locaweb'
    click_on 'Editar'

    fill_in 'Name', with: ''
    fill_in 'Email', with: 'tray@locaweb.com.br'
    click_on 'Salvar Alterações'

    expect(page).to have_content "Name can't be blank"
  end

  scenario " other user's company unsuccessfully" do
    user = user_signup 'joao@joao.com', '09876543'

    company = Company.create!(name: 'Catraca',
                              location: 'Vila Velha',
                              email: 'contact@catraca.net',
                              phone: '32485-9778',
                              user: user)

    another_user = user_signup 'maria@maria.com', '12345678'
    user_signin another_user.email, another_user.password

    visit edit_company_path company

    expect(page).to have_content "User can't edit this company"
  end
end
