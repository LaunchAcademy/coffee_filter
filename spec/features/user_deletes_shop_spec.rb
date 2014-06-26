feature "User deletes a coffee shop" do

  scenario "User can can delte a shop that they created" do
    shop = FactoryGirl.create(:shop)
    user = shop.user
    log_in(user)

    click_link shop.name
    click_link 'Delete'

    expect(page).to have_content('Coffee shop deleted!')
    expect(page).to_not have_content(shop.address)
  end
end
