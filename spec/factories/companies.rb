FactoryGirl.define do
  factory :company do
    sequence :name do |n|
      "Locaweb #{n}"
    end
    location "São Paulo"
    email "loc@web.com"
    phone "112343-3454"
    user
  end
end
