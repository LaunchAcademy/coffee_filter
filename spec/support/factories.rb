FactoryGirl.define do
  factory :shop do
    sequence(:name) { |n| "The Beanery#{n}" }
    address "123 Boston Street"
    description "This place is rad!"
  end

  factory :user do
    first_name "Caleb"
    last_name "Thill"
    email "calebthethriller@gmail.com"
    password "12345678"
  end

  factory :review do
    rating 1
    body "MyText"
  end
end
