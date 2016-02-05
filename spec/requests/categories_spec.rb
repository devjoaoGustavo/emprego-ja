require 'rails_helper'

describe 'Categories API' do
  it 'get the list of categories' do
    categories = create_list(:category, 10)

    get '/api/categories'

    expect(response).to be_success
    expect(JSON.parse(response.body)[0]['name']).to eq categories[0].name
    expect(JSON.parse(response.body)[1]['name']).to eq categories[1].name
    expect(JSON.parse(response.body)[2]['name']).to eq categories[2].name
    expect(JSON.parse(response.body)[3]['name']).to eq categories[3].name
  end

  it 'get the category info' do
    category = create(:category)

    get "/api/categories/#{category.id}"

    expect(response).to be_success
    expect(JSON.parse(response.body)['name']).to eq category.name
  end

  it 'get all categories' do
    categories = create_list(:category, 10)

    get '/api/categories'

    expect(JSON.parse(response.body).count).to eq categories.count
    expect(JSON.parse(response.body)[0]['id']).to eq categories[0].id
  end

  it 'get all category jobs' do
    category = create(:category)
    create_list(:job, 10, category: category)

    get "/api/categories/#{category.id}"

    expect(JSON.parse(response.body)['job_path'])
      .to eq "/api/categories/#{category.id}/jobs"
  end
end
