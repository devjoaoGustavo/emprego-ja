require 'rails_helper'

feature 'User edits contract type' do
  context 'Successfully' do
    scenario 'With correct argument' do
      contract_type = create(:contract_type)
      user = user_signup
      user_signin user.email, user.password

      click_on contract_type.name
      click_on 'Editar'

      fill_in 'Name', with: 'PJ'
      click_on 'Salvar Alterações'

      expect(page).to have_content 'Contract type was successfully updated'
      expect(page).to have_content 'PJ'
    end
  end
end
