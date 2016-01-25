require 'rails_helper'

feature "Vivitor visits job\'s page" do
  scenario 'and see details' do
    job = Job.create(title: "Software Engineer",
                     location: "New York",
                     company: "New York Times",
                     description: "Basically everything related with tecnology wil be your business.",
                     category: "Software Engineering")
    visit root_path
    click_on 'Ver mais'
    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.company
    expect(page).to have_content job.description
    expect(page).to have_content job.category
  end
end
