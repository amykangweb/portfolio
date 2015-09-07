require "test_helper"
# https://github.com/codefellows/portfolio/blob/chapter-4/test/features/check_for_zurb_test.rb
feature "CheckForZurb" do
  scenario "the test is sound" do
    visit root_path
    page.body.must_match /columns/
  end
end
