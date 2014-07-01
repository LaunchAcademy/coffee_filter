require 'rails_helper'

feature 'administrator has full CRUD control' do
  scenario 'admin is able to delete a shop' do
    admin = FactoryGirl.create(:user, role: 'admin')
    shop = FactoryGirl.create(:shop)
    shop_count = Shop.count

    log_in(admin)
    visit shops_path
    click_on "Delete"

    expect(page).to have_content("Coffee shop deleted!")
    expect(Shop.count).to eq(shop_count - 1)
    expect(page).to_not have_content(shop.name)
  end

  scenario 'admin is able to edit a shop' do
    admin = FactoryGirl.create(:user, role: 'admin')
    shop = FactoryGirl.create(:shop)
    shop_count = Shop.count

    log_in(admin)
    visit shops_path
    click_on "Edit"
    fill_in 'Coffee shop name', with: "1369"
    click_on 'Update shop'

    expect(page).to have_content("1369")
    expect(Shop.count).to eq(shop_count)
  end

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
