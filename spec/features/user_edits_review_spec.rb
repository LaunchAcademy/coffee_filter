require 'rails_helper'

feature "User edits a review they created" do

  scenario "User can can edit a review that they created" do
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.create(:review, shop_id: shop.id)
    user = review.user
    log_in(user)

    click_on shop.name
    within '.reviews' do
      click_link 'Edit'
    end

    fill_in "Rating", with: 4
    fill_in "Body", with: "This is one of the best!"


    click_button "Update Review"

    expect(page).to have_content("Review updated!")
    expect(page).to have_content("This is one of the best!")
  end

  scenario "User cant see the edit button if they did not create the review" do
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.create(:review, shop_id: shop.id)
    user = FactoryGirl.create(:user)

    log_in(user)

    click_on shop.name

    within '.reviews' do
      expect(page).to_not have_content('Edit')
    end
  end
end

