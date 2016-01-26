require 'rails_helper'

feature "User is created" do
  scenario 'succefully' do
    user = User.new(name: "João",
                    email: "dev.joaogustavo@gmail.com",
                    password: "senha")
    visit root_path
    click_on 'Registrar-se'

    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Criar Usuário'

    expect(page).to have_content "Usuário #{user.name} criado com sucesso."
  end

  scenario 'Unsuccessfully' do
    user = User.new(name: "João",
                    email: "",
                    password: "")
    visit root_path
    click_on 'Registrar-se'

    fill_in 'Name', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_on 'Criar Usuário'

    expect(page).to have_content "Erro! Nenhum dos campos pode estar vazio."
  end

  scenario ', logged in and logged out successfully' do
    user = User.create!(name: "João",
                    email: "dev.joaogustavo@gmail.com",
                    password: "senha",
                    password_confirmation: "senha")
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "senha"
    click_on 'Acessar'
    expect(page).to have_content "Log-in realizado com sucesso."

    click_on 'Sair'
    expect(page).to have_content "Log-out realizado com sucesso."
  end


end
