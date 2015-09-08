require "test_helper"

feature "Adding portfolio item" do
  scenario "returns success message and correct content" do
    visit projects_path
    click_on "New Project"
    within(".p_name") do
      fill_in "Name", with: "Code Fellows Project"
    end
    within(".p_tech") do
      fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5"
    end
    click_on "Create Project"
    page.text.must_include "Project has been created"
    assert page.has_css?(".notice"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end
end
