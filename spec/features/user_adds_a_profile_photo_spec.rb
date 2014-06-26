feature "User adds a profile photo" do

  scenario "User uploads a profile photo when signing up" do
    user = FactoryGirl.build(:user)

    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    attach_file 'Profile photo', 'app/assets/images/92.jpg'
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign Up'

    expect(page).to have_content('Sign Out')
    expect(page).to have_content(user.profile_photo)


  end

  scenario "Existing user with profile photo updates their profile photo" do
    user = FactoryGirl.create(:user)
    log_in(user)
    visit edit_user_registration_path
    attach_file 'Profile photo', 'app/assets/images/92.jpg'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('You updated your account successfully.')
  end

  scenario "Existing user without profile photo uploads a profile photo" do
    user = FactoryGirl.build(:user)

    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign Up'

    visit edit_user_registration_path
    attach_file 'Profile photo', 'app/assets/images/92.jpg'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('You updated your account successfully.')
  end

end
