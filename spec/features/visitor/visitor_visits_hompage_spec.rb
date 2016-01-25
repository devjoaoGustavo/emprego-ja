require 'rails_helper'

feature 'Visitor visits homepage' do

  scenario 'successfully' do
    visit root_path
    expect(page).to have_content "Emprego Já"
  end

  scenario 'and sees all jobs' do
    category = Category.create(name: "Development")
    company = Company.create!(name: "Xerox",
                             location: "San Francisco",
                             email: "contact@xerox.com",
                             phone: "1-254-154-1549")
    job = Job.create!(title: "Developer Ruby Junior",
                     location: "San Francisco",
                     category: category,
                     description: "Develop software solution for libraries",
                     company: company)
    visit root_path
    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content category.name
    expect(page).to have_content company.name
  end

  scenario "and sees \'See More\' button" do
    category = Category.create(name: "Development")
    company = Company.create!(name: "Xerox",
                             location: "SanFracisco",
                             email: "dev@xerox.com",
                             phone: "1-254-154-2568")
    job = Job.create!(title: "Developer Ruby Junior",
                     location: "San Francisco",
                     category: category,
                     description: "Develop software solution for libraries",
                     company: company)
    visit root_path
    click_on 'Ver mais'
    expect(current_path).to eq job_path(job)
  end

end
