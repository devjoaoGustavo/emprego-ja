require 'rails_helper'

feature "Visitor visits job\'s page" do
  scenario 'and see details' do
    category = Category.create(name: "Software Engineering")
    company = Company.create(name: "New York Times",
                             location: "New York",
                             email: "tecno@times.com",
                             phone: "1-598-678-2564")
    job = Job.create(title: "Software Engineer",
                     location: "New York",
                     company: company,
                     description: "Basically everything related with tecnology wil be your business.",
                     category: category)
    visit root_path
    click_on 'Ver mais'
    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content category.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
  end
end
