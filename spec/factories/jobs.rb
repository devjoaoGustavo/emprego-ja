FactoryGirl.define do
  factory :job do
    sequence :title do |n|
      "Developer Ruby#{n}"
    end
    location "São Paulo"
    description 'Develops web applications for financial business'
    category
    contract_type
    company
    featured true
  end
end
