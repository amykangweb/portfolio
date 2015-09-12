require 'test_helper'

feature 'Signing out user' do
  before do
    sign_in
  end

  scenario 'returns a sucess message' do
    click_link "Sign Out"
    page.text.must_include "Signed out successfully."
  end
end
