require 'rails_helper'

feature 'User creates new category' do
  scenario 'successfully' do

    category = Category.new(name: "Sales")

    visit root_path
    click_on 'Nova Categoria'

    fill_in 'Name', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content category.name
  end

  scenario 'unsuccessfully' do
    visit root_path
    click_on 'Nova Categoria'

    fill_in 'Name', with: ""
    click_on 'Criar Categoria'

    expect(page).to have_content "Erro! Nome da categoria não pode ser vazio."
  end
end
