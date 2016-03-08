require 'rails_helper'

feature 'User creates a contract_type' do
  context 'Successfully' do
    scenario 'with correct argument' do
      user = user_signup
      user_signin user.email, user.password

      click_on 'Novo Tipo de Contratação'

      fill_in 'Name', with: 'Freela'

      click_on 'Criar tipo de contratação'

      expect(page).to have_content 'Contract type was successfully created'
      expect(page).to have_content 'Freela'
    end
  end
end
