feature "User edits a coffee shop" do

  scenario "User can can edit a shop that they created" do
    # user = FactoryGirl.create(:user)
    shop = FactoryGirl.create(:shop)

    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    click_link shop.name
    click_link 'Edit'
    fill_in 'Coffee shop name', with: 'Dunkbux'
    click_button 'Update shop'

    expect(page).to have_content('Dunkbux')
    expect(page).to have_link('Edit')
  end
end
