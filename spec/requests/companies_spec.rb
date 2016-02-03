require 'rails_helper'

describe 'Company API' do
  it 'get the company info' do
    company = create(:company)

    get "/api/companies/#{company.id}"

    expect(response).to be_success
    expect(JSON.parse(response.body)['name']).to eq company.name
    expect(JSON.parse(response.body)['location']).to eq company.location
    expect(JSON.parse(response.body)['email']).to eq company.email
    expect(JSON.parse(response.body)['phone']).to eq company.phone
  end

  it 'get a nonexistent company' do
    company = create(:company)

    expect { get "/api/companies/5" }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'get a list of companies' do
    companies = create_list(:company, 5)

    get "/api/companies"

    expect(response).to be_success
    expect(JSON.parse(response.body)[0]['name']).to eq companies[0].name
    expect(JSON.parse(response.body)[1]['location']).to eq companies[1].location
    expect(JSON.parse(response.body)[2]['email']).to eq companies[2].email
    expect(JSON.parse(response.body)[3]['phone']).to eq companies[3].phone
  end

  it 'get all companies' do
    companies = create_list(:company, 10)

    get "/api/companies"

    expect(JSON.parse(response.body).count).to eq companies.count
  end

  it 'get the company jobs' do
    company = create(:company)
    jobs = create_list(:job, 10, company: company)

    get "/api/companies/#{company.id}"

    expect(JSON.parse(response.body)['job_path']).to eq "/api/companies/#{company.id}/jobs"
  end
end
