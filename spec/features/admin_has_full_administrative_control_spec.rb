require 'rails_helper'

feature 'administrator has full CRUD control' do
  scenario 'admin is able to see all the reviews and delete them' do
    admin = FactoryGirl.create(:user, role: 'admin')
    shop = FactoryGirl.create(:shop)
    review = FactoryGirl.create(:review, shop_id: shop.id)
    review_count = Review.count

    log_in(admin)
    visit admin_reviews_path

    expect(page).to have_content review.body
    expect(page).to have_link "Delete"

    click_on "Delete"
    expect(Review.count).to eq(review_count - 1)
  end
end
