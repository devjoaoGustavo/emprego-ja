require 'rails_helper'

feature 'User uploads the company logo' do
  scenario 'successfully' do
    user = User.create!(name: "João",
                    email: "dev.joaogustavo@gmail.com",
                    password: "senha",
                    password_confirmation: "senha")
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "senha"
    click_on 'Acessar'

    click_on 'Nova Empresa'

    company = Company.new(name: "Locaweb",
                          location: "São Paulo",
                          email: "loca@web.com.br",
                          phone: "(11)562-9568")

    fill_in 'Name', with: company.name
    fill_in 'Location', with: company.location
    fill_in 'Email', with: company.email
    fill_in 'Phone', with: company.phone
    attach_file 'Logo', '/home/joao/Imagens/logo.png'
    click_on 'Criar empresa'

    expect(page).to have_css "img[src*='logo.png']"

  end
end
