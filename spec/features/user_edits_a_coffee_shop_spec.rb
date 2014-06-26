feature "User edits a coffee shop" do

  scenario "User can can edit a shop that they created" do
    shop = FactoryGirl.create(:shop)
    user = shop.user
    log_in(user)

    click_link shop.name
    click_link 'Edit'
    fill_in 'Coffee shop name', with: 'Dunkbux'
    click_button 'Update shop'

    expect(page).to have_content('Dunkbux')
    expect(page).to have_content('Shop updated!')
    expect(page).to have_link('Edit')
    expect(page).to_not have_content('Please correct the errors and try again')
  end
end
