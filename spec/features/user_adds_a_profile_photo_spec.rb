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

  scenario "Existing user with profile photo updates their profile photo"

  scenario "Existing user without profile photo uploads a profile photo"

end


<%= %>
