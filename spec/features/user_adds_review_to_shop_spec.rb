require 'rails_helper'

feature 'user visits shop page and leaves review' do
  scenario 'user successfully uploads a review' do
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.create(:review, shop_id: shop)
    visit shop_path(shop)

    fill_in "Rating", with: review.rating
    fill_in "Body", with: review.body
    click_button "Add Review"

    expect(page).to have_content('Review has been added')
    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)
  end

  scenario 'user does not provide correct information' do





    expect(page).to have_content('review did not go through!')
  end
end