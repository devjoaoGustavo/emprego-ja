require 'rails_helper'

feature 'User edits category' do
  context 'Successfully' do
    scenario 'with arguments' do
      category = create(:category)
      user = user_signup
      user_signin user.email, user.password

      click_on category.name

      click_on 'Editar'

      fill_in 'Name', with: 'Logística'
      click_on 'Salvar alterações'

      expect(page).to have_content 'Category was successfully updated.'
      expect(page).to have_content 'Logística'
    end
  end
end
