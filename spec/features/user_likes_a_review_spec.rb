require 'rails_helper'

feature 'user can like a review' do
  scenario 'user clicks the like button' do
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.create(:review, shop: shop)
    user = FactoryGirl.create(:user)

    log_in(user)

    click_link shop.name

    click_button "Like"
    expect(page).to have_content("Thanks for the like!")
    expect(page).to have_button "Unlike"
  end

  scenario 'user clicks the unlike button' do
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.create(:review, shop: shop)
    user = FactoryGirl.create(:user)

    log_in(user)

    click_link shop.name

    click_button "Like"
    click_button "Unlike"

    expect(page).to have_content("You just unliked that review!")
    expect(page).to have_button "Like"
  end
end
