FactoryGirl.define do
  factory :contract_type do
    sequence :name do |n|
      "Freelancer #{n}"
    end
  end
end
