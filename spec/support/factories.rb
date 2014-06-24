FactoryGirl.define do
  factory :shop do
    name "The Beanery"
    address "123 Boston Street"
    description "This place is rad!"
  end
end

FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Loblaw"
    email "test@test.com"
    password "12345678"
    password_confirmation "12345678"
  end
end
