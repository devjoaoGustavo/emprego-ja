require 'rails_helper'

feature 'User create a new job' do
  scenario 'succefully' do
    visit root_path
    click_on 'Nova Vaga'
    job = Job.new(title: "Customer support analist",
                  location: "São Paulo",
                  company: "Google",
                  description: "Helps the customer in all kind of doubts related to the Google\'s services",
                  category: "Help desk")

    fill_in 'Title', with: job.title
    fill_in 'Location', with: job.location
    fill_in 'Company', with: job.company
    fill_in 'Description', with: job.description
    fill_in 'Category', with: job.category

    click_on 'Criar Vaga'
    expect(page).to have_content "Vaga criada com sucesso."
  end
end
