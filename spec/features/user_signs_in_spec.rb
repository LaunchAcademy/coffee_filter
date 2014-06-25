require 'rails_helper'

feature 'User can sign in or sign up' do

  scenario "User can sign up sucessfully" do

    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: 'Caleb'
    fill_in 'Last name', with: 'Thill'
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content('Thanks for signing up!')
    expect(page).to have_content('Sign Out')
  end


  scenario "User doesn't provide a username or password when they sign up" do

    visit root_path
    click_link 'Sign Up'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content('Email can\'t be blank')
  end


  scenario "User is presented with an error when password does not match password confirmation" do

    visit root_path
    click_link 'Sign Up'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'wrongPassword'
    click_button 'Sign Up'

    expect(page).to have_content("Password confirmation doesn't match Password")
  end


  scenario "User can sign in when they provide their input" do

    user1 = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password

    click_button "Sign in"

    expect(page).to have_content('Signed in successfully.')
  end


  scenario "User is presented with an error with an invalid sign in attempt" do
    user1 = FactoryGirl.create(:user)

    visit root_path
    click_link "Sign In"
    fill_in "Email", with: "nobody@nothing.com"
    fill_in "Password", with: "100110010101"

    click_button "Sign in"

    expect(page).to have_content("Invalid email or password.")

  end
end
