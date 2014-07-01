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

  scenario 'shop creator is sent an email when a review of that shop is submitted' do
    user = FactoryGirl.create(:user)
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.build(:review, shop: shop, user: user)

    ActionMailer::Base.deliveries = []
    prev_count = UserReviewConfirmation.deliveries.count

    log_in(user)
    click_on shop.name
    fill_in "Rating", with: review.rating
    fill_in "Body", with: review.body
    click_button "Add Review"


    expect(page).to have_content('Review has been added')
    expect(UserReviewConfirmation.deliveries.count).to eq(prev_count + 1)
    expect(ActionMailer::Base.deliveries.size).to eq(1)

    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject("Caleb has reviewed the coffee shop you added!")
    expect(last_email).to deliver_to(user.email)
  end
end
