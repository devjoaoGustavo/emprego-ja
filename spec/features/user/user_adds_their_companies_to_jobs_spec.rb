require 'rails_helper'

feature 'User adds jobs only for their companies' do
  scenario 'correctly' do
    user = user_signup 'm@ail.com', '12345678'

    company_1 = Company.create(name: 'Locaweb',
                               location: 'São Paulo',
                               email: 'loc@web.com',
                               phone: '4532-3849',
                               user: user)
    company_2 = Company.create(name: 'Campus Code',
                               location: 'São Paulo',
                               email: 'campus@code.com.br',
                               phone: '4544-3289',
                               user: user)

    another_user = user_signup 'm@ria.com', '87654321'

    company_3 = Company.create(name: 'Extra',
                               location: 'Ribeirão Preto',
                               email: 'extra@extra.com',
                               phone: '9865-9859',
                               user: another_user)
    company_4 = Company.create(name: 'Extra',
                               location: 'Ribeirão Preto',
                               email: 'extra@extra.com',
                               phone: '9865-9859',
                               user: another_user)

    user_signin user.email, user.password

    click_on 'Nova Vaga'

    expect(page).to have_content company_1.name
    expect(page).to have_content company_2.name
    expect(page).not_to have_content company_3.name
    expect(page).not_to have_content company_4.name
  end
end
