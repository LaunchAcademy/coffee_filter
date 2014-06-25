FactoryGirl.define do
  factory :shop do
    name "The Beanery"
    address "123 Boston Street"
    description "This place is rad!"
  end

  factory :user do
    first_name "Caleb"
    last_name "Thill"
    email "calebthethriller@gmail.com"
    password "12345678"
  end
end
