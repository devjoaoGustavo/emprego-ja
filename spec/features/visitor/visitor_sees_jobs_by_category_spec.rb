require "rails_helper"

feature 'Visitor sees jobs by category' do
  scenario 'successfully' do
    category = Category.create!(name: "Development")
    company = Company.create!(name: "Locaweb",
                             location: "São Paulo",
                             email: "loc@web.com.br",
                             phone: "(11)96589-9854")
    job = Job.create!(title: "Junior Ruby\'s developer",
                  category: category,
                  company: company,
                  location: "São Paulo",
                  description: "New developer for improve our team")
    visit root_path
    click_on 'Development'
    expect(page).to have_content category.name
    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content company.name
    expect(page).to have_content 'Ver mais'
  end
end
