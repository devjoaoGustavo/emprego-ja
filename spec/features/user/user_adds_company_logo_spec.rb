require 'rails_helper'

feature 'User uploads the company logo' do
  scenario 'successfully' do

    user_signup
    user_signin

    expect(page).to have_content "Nova Empresa"

    click_on 'Nova Empresa'

    company = Company.new(name: "Locaweb",
                          location: "São Paulo",
                          email: "loca@web.com.br",
                          phone: "(11)562-9568")

    fill_in 'Name', with: company.name
    fill_in 'Location', with: company.location
    fill_in 'Email', with: company.email
    fill_in 'Phone', with: company.phone
    attach_file 'Logo', 'http://res.cloudinary.com/devjoaogustavo/image/upload/v1454373982/sample.jpg'
    click_on 'Criar empresa'

    expect(page).to have_css "img[src*='sample.jpg']"

  end
end
