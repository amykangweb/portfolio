require "test_helper"
# Working!
feature "Sign in user" do
  scenario "returns success message" do
    user = users(:wilbur)
    user.save
    visit new_user_session_path
    within(".d_mail") do
        fill_in "Email", with: user.email
    end
    fill_in "Password", with: "password"
    click_on "Log in"
    page.text.must_include "Signed in successfully."
  end
end
