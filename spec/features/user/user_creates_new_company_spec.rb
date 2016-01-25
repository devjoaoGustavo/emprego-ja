require 'rails_helper'

feature "User creates a new company" do
  scenario 'successfully' do
    visit root_path
    click_on 'Nova Empresa'

    company = Company.new(name: "Locaweb",
                          location: "São Paulo",
                          email: "loca@web.com.br",
                          phone: "(11)562-9568")

    fill_in 'Name', with: company.name
    fill_in 'Location', with: company.location
    fill_in 'Email', with: company.email
    fill_in 'Phone', with: company.phone
    click_on 'Criar empresa'

    expect(page).to have_content company.name
    expect(page).to have_content company.location
    expect(page).to have_content company.email
    expect(page).to have_content company.phone
    expect(page).to have_content "Empresa criada com sucesso."

  end
end