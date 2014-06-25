require 'rails_helper'

feature 'User can upvote another users review.' do

  scenario 'User clicks the like vote to upvote a review' do
    reviewer = FactoryGirl.create(:user)
    liker = FactoryGirl.create(:user)
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.create(:review, shop_id: shop, user_id: reviewer)
    binding.pry
    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: liker.first_name
    fill_in 'Last name', with: liker.last_name
    fill_in 'Email', with: liker.email
    fill_in 'Password', with: liker.password
    fill_in 'Password confirmation', with: liker.password
    click_button 'Sign Up'

    visit root_path
    click_on "Sign In"

    fill_in "Email", with: liker.email
    fill_in "Password", with: liker.password

    click_on "Sign in"

    visit shop_path(shop)

    click_on "Like"

    expect(page).to have_content("You have liked this review")

  end

  scenario 'User that liked a review can revoke it by clicking the liked button'
end
