FactoryGirl.define do
  factory :shop do
    name 'The Beanery'
    address '123 Boston Street'
    description 'This place is rad!'

    association :user
  end

  factory :user do
    first_name 'Caleb'
    last_name 'Thrill'
    sequence(:email) { |n| "calebthethriller#{n}@gmail.com" }
    password '12345678'
  end
end
