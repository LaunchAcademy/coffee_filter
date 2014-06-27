require 'rails_helper'

feature 'user visits shop page and add review' do
  scenario 'user successfully uploads a review' do
    user = FactoryGirl.create(:user)
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.build(:review, shop: shop, user: user)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"

    click_link shop.name

    fill_in "Rating", with: review.rating
    fill_in "Body", with: review.body

    click_button "Add Review"

    expect(page).to have_content('Review has been added')
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)
  end

  scenario 'user does not provide correct information' do

    user = FactoryGirl.create(:user)
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.build(:review, shop: shop, user: user)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"

    visit shop_path(shop)

    click_button "Add Review"

    expect(page).to have_content('review did not go through!')
  end
end
