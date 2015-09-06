require "test_helper"

class IndexSpecTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    within(".header") do
      page.text.must_include "Amy Kang"
      page.text.must_include "Designer / Developer"
    end
    refute_content page, "Goobye All!"
  end
end
