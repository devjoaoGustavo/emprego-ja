require 'rails_helper'

feature 'User inserts contract type in jobs' do
  scenario 'successfully' do
    user = user_signup
    company = Company.create!(name: 'Locaweb',location: 'São Paulo',email: 'loc@web.com',phone: '11256489-9856', user: user)
    new_categories 4,"Management"
    new_contract_types 7,"Freelancer"
    user_signin user.email,user.password

    visit new_job_path

    fill_in 'Title', with: "Counter"
    fill_in 'Location', with: 'Santos'
    fill_in 'Description', with: "Deals with all the money's flow in the company"
    select company.name, from: 'Company'
    select 'Management 2', from: 'Category'
    select 'Freelancer 3', from: 'Contract type'

    click_on "Criar Vaga"

    expect(page).to have_content "Job was successfully created"
    expect(page).to have_content "Management 2"
  end
end
