require 'rails_helper'

feature 'User create a new job' do
  scenario 'succefully' do
    company = Company.create(name: "Google",
                   location: "São Paulo",
                   email: "google@gmail.com",
                   phone: "(11)98584-4656")
    visit root_path
    click_on 'Nova Vaga'
    job = Job.new(title: "Customer support analist",
                  location: "São Paulo",
                  description: "Helps the customer in all kind of doubts related to the Google\'s services",
                  category: "Help desk")

    fill_in 'Title', with: job.title
    fill_in 'Location', with: job.location
    select company.name, from: 'Company'
    fill_in 'Description', with: job.description
    fill_in 'Category', with: job.category

    click_on 'Criar Vaga'
    expect(page).to have_content "Vaga criada com sucesso."

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content company.name
    expect(page).to have_content job.category
    expect(page).to have_content job.description
  end

  scenario 'unsuccessfully' do
    company = Company.create(name: "Google",
                   location: "São Paulo",
                   email: "google@gmail.com",
                   phone: "(11)98584-4656")
    visit root_path
    click_on 'Nova Vaga'
    click_on 'Criar Vaga'
    expect(page).to have_content "Erro! Nenhum do campos pode estar vazio."
  end

  scenario 'and features it' do
    company = Company.create(name: "Americanas",
                   location: "Curitiba",
                   email: "sales@americanas.com.br",
                   phone: "(45)56894-4684")
    visit root_path
    click_on 'Nova Vaga'
    job = Job.new(title: "Sales manager",
                  location: "Curitiba",
                  category: "Sales",
                  description: "Deal with the sales department in the south region of Brazil")

    fill_in 'Title', with: job.title
    fill_in 'Location', with: job.location
    select company.name, from: 'Company'
    fill_in 'Description', with: job.description
    fill_in 'Category', with: job.category
    check 'Featured'
    click_on 'Criar Vaga'

    expect(page).to have_content "Vaga criada com sucesso."

    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content company.name
    expect(page).to have_content job.category
    expect(page).to have_content job.description

    expect(page).to have_content "Vaga em Destaque!"

  end
end
