require 'test_helper'

feature 'User Signup' do
  scenario 'returns success message' do
    visit root_path
    click_link "Sign In"
    click_link "Sign up"
    within(".d_mail") do
      fill_in "Email", with: "amy@mail.com"
    end
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    page.text.must_include "Welcome! You have signed up successfully."
    page.text.wont_include "There was a problem with your sign up"
  end
end
