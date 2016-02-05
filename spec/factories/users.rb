FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "maria#{n}@gmail.com"
    end
    password '12345678'
    password_confirmation '12345678'
  end
end
