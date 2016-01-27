require 'rails_helper'

feature 'User edits company' do
  scenario 'Successfully' do

    company = Company.create!(name: "Locaweb",
                             location: "São Paulo",
                             email: "loc@web.com.br",
                             phone: "(11)4854-4684")

    user = User.create!(name: "Joaquim", email: "jo@quim.com", password: "12345", password_confirmation: "12345")
    visit login_path
    fill_in 'Email', with: user.name
    fill_in 'Password', with: user.password
    click_on 'Acessar'

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
    visit root_path
    click_on 'Locaweb'
    click_on 'Editar'

    fill_in 'Name', with: ''
    fill_in 'Email', with: 'tray@locaweb.com.br'
    click_on 'Salvar Alterações'

    expect(page).to have_content "Erro! Nenhum dos campos pode ser vazio"
  end
end
