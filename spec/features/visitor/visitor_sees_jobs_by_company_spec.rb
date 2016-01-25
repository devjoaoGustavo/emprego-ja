require 'rails_helper'

feature 'Visitor see jobs by company' do
  scenario 'successfully' do
    category = Category.create(name: "Development")
    company = Company.create!(name: "Google",
                   location: "Rio de Janeiro",
                   email: "gl@gmail.com",
                   phone: "(21)45789-9568")

    job = Job.create!(title: "Go developer Senior",
                      location: "Ilha Bela",
                      category: category,
                      company: company,
                      description: "Solve some process\'s issues about the products")
    visit root_path
    click_on company.name
    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content category.name
    expect(page).to have_content "Ver mais"
  end
end
