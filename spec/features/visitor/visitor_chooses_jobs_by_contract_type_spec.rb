require 'rails_helper'

feature 'Visitor chooses jobs by contract type' do
  scenario 'successfully' do
    company = Company.create!(name: 'Locaweb',
                              location: 'Guarujá',
                              email: 'loc@web.com',
                              phone: '1493874-2839')
    new_categories 5, 'Development'
    new_contract_types 5, 'Freelancer'
    job = Job.create!(title: 'QA expert',
                      location: 'Peruíbe',
                      category: Category.last,
                      company: company,
                      description: 'Reviews the UX aspects of a web system',
                      contract_type: ContractType.last)
    visit root_path
    click_on 'Freelancer 5'

    expect(page).to have_content job.title
    expect(page).to have_content job.category.name
    expect(page).to have_content company.name
  end
end
