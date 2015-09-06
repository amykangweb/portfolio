require "test_helper"

class IndexSpecTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    within("h1") do
      page.text.must_include "Amy Kang"
    end
    refute_content page, "Goobye All!"
  end

  test "about" do
    visit root_path
    page.text.must_include "About"
  end
end
