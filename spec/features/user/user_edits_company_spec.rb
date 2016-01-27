require 'rails_helper'

feature 'User edits company' do
  scenario 'Successfully' do

    company = Company.create!(name: "Locaweb",
                             location: "São Paulo",
                             email: "loc@web.com.br",
                             phone: "(11)4854-4684")

    user = user_signup
    user_signin user.email,user.password

    click_on 'Locaweb'
    click_on 'Editar'

    fill_in 'Name', with: 'Tray'
    fill_in 'Email', with: 'tray@locaweb.com.br'
    click_on 'Salvar Alterações'

    expect(page).to have_content "Empresa alterada com sucesso."
    expect(page).to have_content "Tray"
    expect(page).to have_content "tray@locaweb.com.br"
  end

  scenario 'Unsuccessfully' do
    company = Company.create!(name: "Locaweb",
                             location: "São Paulo",
                             email: "loc@web.com.br",
                             phone: "(11)4854-4684")
    user = user_signup
    user_signin user.email,user.password

    click_on 'Locaweb'
    click_on 'Editar'

    fill_in 'Name', with: ''
    fill_in 'Email', with: 'tray@locaweb.com.br'
    click_on 'Salvar Alterações'

    expect(page).to have_content "Erro! Nenhum dos campos pode ser vazio"
  end
end
