require 'rails_helper'

feature 'User creates new category' do
  scenario 'successfully' do

    category = Category.new(name: "Sales")
    user = User.create!(name: "João",
                    email: "dev.joaogustavo@gmail.com",
                    password: "senha",
                    password_confirmation: "senha")
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "senha"
    click_on 'Acessar'

    click_on 'Nova Categoria'

    fill_in 'Name', with: category.name
    click_on 'Criar Categoria'

    expect(page).to have_content category.name
  end

  scenario 'unsuccessfully' do
    user = User.create!(name: "João",
                    email: "dev.joaogustavo@gmail.com",
                    password: "senha",
                    password_confirmation: "senha")
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "senha"
    click_on 'Acessar'

    click_on 'Nova Categoria'

    fill_in 'Name', with: ""
    click_on 'Criar Categoria'

    expect(page).to have_content "Erro! Nome da categoria não pode ser vazio."
  end
end
