require "test_helper"

feature "Visiting index page" do
  it "has correct header test" do
    visit root_path
    within(".header") do
      page.text.must_include "Amy Kang"
      page.text.must_include "Designer / Developer"
    end
    refute_content page, "Goobye All!"
  end
end
