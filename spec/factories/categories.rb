FactoryGirl.define do
  factory :category do
    sequence :name do |n|
      "Development#{n}"
    end
  end
end
