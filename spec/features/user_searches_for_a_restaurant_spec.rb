require 'rails_helper'

feature 'User searches for a particular restaurant' do
  scenario 'User enters in a shop and gets a list' do
    search = "Nero"
    shop1 = FactoryGirl.create(:shop, name: "Nero")
    shop2 = FactoryGirl.create(:shop)

    visit root_path

    fill_in "Search", with: search
    click_on "Search Shops"

    expect(page).to have_content(shop1.name)
    expect(page).to_not have_content(shop2.name)
  end

  scenario 'user enters an invalid shop and gets no results'
end
