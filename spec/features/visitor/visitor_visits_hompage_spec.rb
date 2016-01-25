require 'rails_helper'

feature 'Visitor visits homepage' do
  include ActiveSupport::Testing::TimeHelpers

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

  scenario 'and sees recents jobs featured' do
    travel_to 3.days.ago do
      category = Category.create!(name: "sales")
      company = Company.create!(name: "McDonalds",
                               location: "Arizona",
                               email: "mc@donald.com",
                               phone: "1-548-859-6544")
      job = Job.create!(title: "Sales manager",
                        location: "New Mexico",
                        category: category,
                        company: company,
                        description: "A simple job for a simple person.")
    end

    expect(Job.last).to be_recent

    visit root_path
    expect(page).to have_content "Nova Vaga!!!"
  end

  scenario "and doesn\'t see old jobs featured" do
    travel_to 6.days.ago do
      category = Category.create!(name: "sales")
      company = Company.create!(name: "McDonalds",
                               location: "Arizona",
                               email: "mc@donald.com",
                               phone: "1-548-859-6544")
      job = Job.create!(title: "Sales manager",
                        location: "New Mexico",
                        category: category,
                        company: company,
                        description: "A simple job for a simple person.")
    end
    visit root_path
    expect(page).not_to have_content "Nova Vaga!!!"
  end

  scenario 'and sees a premium company featured' do
    company = Company.create!(name: "McDonalds",
                             location: "Arizona",
                             email: "mc@donald.com",
                             phone: "1-123-859-6544")
    10.times do |i|
      category = Category.create!(name: "Help-desk #{i}")
       job = Job.create!(title: "Sales manager#{i + 3}",
                         location: "New Mexico",
                         category: category,
                         company: company,
                         description: "A simple job for a simple person.")
    end
    expect(Company.last).to be_premium
    visit root_path
    expect(page).to have_content "Premium!!!"
  end

  scenario "and doesn\'t see a premium company featured" do
    company = Company.create!(name: "McDonalds",
                             location: "Arizona",
                             email: "mc@donald.com",
                             phone: "1-123-859-6544")
    3.times do |i|
      category = Category.create!(name: "Help-desk #{i}")
       job = Job.create!(title: "Sales manager#{i + 3}",
                         location: "New Mexico",
                         category: category,
                         company: company,
                         description: "A simple job for a simple person.")
    end
    visit root_path
    expect(page).not_to have_content "Premium!!!"
  end

end
