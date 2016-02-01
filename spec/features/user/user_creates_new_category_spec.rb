require 'rails_helper'

feature 'User creates new category' do
  scenario 'successfully' do

    category = Category.new(name: "Sales")

    user = user_signup
    user_signin user.email,user.password

    click_on 'Nova Categoria'

    fill_in 'Name', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content category.name
  end

  scenario 'unsuccessfully' do
    user = user_signup
    user_signin user.email,user.password

    click_on 'Nova Categoria'

    fill_in 'Name', with: ""
    click_on 'Criar Categoria'

    expect(page).to have_content "Name can't be blank"
  end
end
