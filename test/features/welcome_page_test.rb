require 'test_helper'

feature "Deployed site" do
  scenario "returns correct header message", :js => true do
    visit("http://amy-kang-portfolio.herokuapp.com")
    within(".header") do
      page.text.must_include "Amy Kang"
    end
  end
end
