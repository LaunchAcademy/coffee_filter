require 'rails_helper'

feature "User adds a coffee shop", %Q{
  As a logged-in user
  I want to add a coffee shop
  So that site users can review it

  Acceptance Criteria:

  I must log in
  I must provide the coffee shop name, address, and description
  I can optionally add pictures
  If I don't provide a name, address, or description I am presented with an error
  } do

  scenario "User adds a coffee shop" do

    shop = FactoryGirl.build(:shop)
    #user = FactoryGirl.create(:user)

    visit root_path
    # sign in!
    click_link "Add a coffee shop"
    fill_in "Coffee shop name:", with: shop.name
    fill_in "Address", with: shop.address
    fill_in "Description", with: shop.description
    click_button "Add Shop"

    expect(page).to have_content('Shop added!')
    expect(page).to have_content(shop.name)
  end

  scenario "User submits invalid input" do
    shop = FactoryGirl.create(:shop)
    #user = FactoryGirl.create(:user)

    visit root_path
    # sign in!
    click_link "Add a coffee shop"
    click_button "Add Shop"

    expect(page).to have_content('Please correct the errors and try again')

  end


  # scenario "User must be logged in to add coffee shop"



end
