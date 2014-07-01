require 'rails_helper'

feature 'User uses search bar to find a coffee shop' do
  scenario 'User successfully finds an existing shop' do
    shop = FactoryGirl.create(:shop)
    user = FactoryGirl.create(:user)

    visit root_path
    log_in(user)

    fill_in "search", with: shop.name
    click_on "Search"

    expect(page).to have_content(shop.name)
  end

  scenario 'User searches for a non-existing coffee shop' do
    shops = FactoryGirl.create_list(:shop, 10)
    user = FactoryGirl.create(:user)

    visit root_path
    log_in(user)

    fill_in "search", with: 'foo'
    click_on "Search"

    shops.each do |shop|
      expect(page).to_not have_content(shop.name)
    end
  end
end
