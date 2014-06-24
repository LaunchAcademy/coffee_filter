require 'rails_helper'

feature 'user views a list of all shops' do
  it 'returns a list of all coffee shops' do

    first_shop = FactoryGirl.create(:shop, name: "The Beanery")
    second_shop = FactoryGirl.create(:shop, name: "Java City")
    third_shop = FactoryGirl.create(:shop, name: "The Filter")

    visit '/shops'
    expect(page).to have_content "The Beanery"
    expect(page).to have_content "Java City"
    expect(page).to have_content "The Filter"
  end
end
