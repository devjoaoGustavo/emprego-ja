require 'rails_helper'

describe 'Job API' do
  before do
    FactoryGirl.reload
  end
  it 'get all jobs' do
    create_list(:job, 10)

    get "/api/jobs"

    expect(response).to be_success
    expect(JSON.parse(response.body)[0]['title']).to eq "Developer Ruby1"
    expect(JSON.parse(response.body)[1]['title']).to eq "Developer Ruby2"
  end

  it 'get a job' do
    job = create(:job)

    get "/api/jobs/#{job.id}"

    expect(response).to be_success
    expect(JSON.parse(response.body)['title']).to eq job.title
    expect(JSON.parse(response.body)['location']).to eq job.location
  end

  it 'get a nonexistent job' do
    job = create(:job)
    expect { get "/api/jobs/2" }.to raise_error(ActiveRecord::RecordNotFound)
  end

  it 'get all jobs' do
    jobs = create_list(:job, 10)

    get "/api/jobs"

    expect(JSON.parse(response.body).count).to eq jobs.count
  end
end
