require 'rails_helper'

feature 'User edits job' do
  scenario 'successfully' do
    category = Category.create!(name: "Sales")
    category2 = Category.create!(name: "Development")
    company = Company.create!(name: "Google",
                             location: "São Paulo",
                             email: "google@gmail.com",
                             phone: "(11)6589-8565")
    job = Job.create!(title: "Haskell developer",
                      location: "São Paulo",
                      company: company,
                      category: category,
                      description: "Junior developer with at least a personal project")
    visit root_path
    click_on 'Ver mais'
    click_on 'Editar'

    select category2.name, from: 'Category'
    fill_in 'Location', with: 'Campinas'
    click_on 'Salvar Alterações'

    expect(page).to have_content "Vaga alterada com sucesso."
    expect(page).to have_content category2.name
    expect(page).to have_content 'Campinas'
  end

  scenario 'unsuccessfully' do
    category = Category.create!(name: "Sales")
    category2 = Category.create!(name: "Development")
    company = Company.create!(name: "Google",
                             location: "São Paulo",
                             email: "google@gmail.com",
                             phone: "(11)6589-8565")
    job = Job.create!(title: "Haskell developer",
                      location: "São Paulo",
                      company: company,
                      category: category,
                      description: "Junior developer with at least a personal project")
    visit root_path
    click_on 'Ver mais'
    click_on 'Editar'

    fill_in 'Title', with: ""
    click_on 'Salvar Alterações'

    expect(page).to have_content "Erro! Nenhum dos campos pode estar vazio."
  end
end
