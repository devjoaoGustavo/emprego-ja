require 'rails_helper'

feature 'Visitor visits hompage' do

  scenario 'successfully' do
    visit root_path
    expect(page).to have_content "Emprego Já"
  end

  scenario 'and sees all jobs' do
    job = Job.create(title: "Developer Ruby Junior",
                     location: "San Francisco",
                     company: "Xerox")
    visit root_path
    expect(page).to have_content job.title
    expect(page).to have_content job.location
    expect(page).to have_content job.company
  end

end
