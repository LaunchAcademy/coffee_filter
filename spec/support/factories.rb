FactoryGirl.define do
  factory :shop do
    sequence(:name) { |n| "The Beanery#{n}" }
    address "123 Boston Street"
    description "This place is rad!"
    user
  end

  factory :user do
    first_name 'Caleb'
    last_name 'Thrill'
    sequence(:email) { |n| "calebthethriller#{n}@gmail.com" }
    password '12345678'
    role 'member'
  end

  factory :review do
    rating 1
    body "MyText"

    user
    shop
  end
end
