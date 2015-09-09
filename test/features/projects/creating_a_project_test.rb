require "test_helper"

feature "Adding portfolio item" do
  before do
    visit projects_path
    click_on "New Project"
  end

  scenario "returns success message and correct content" do
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

  scenario "returns error message when name is blank" do
    within(".p_name") do
      fill_in "Name", with: ""
    end
    click_on "Create Project"
    page.text.must_include "Name is too short (minimum is 4 characters)"
    page.text.must_include "Project could not be saved."
    assert page.has_css?(".error"), "Expected an error message on this page, none found."
  end

  scenario "returns error message when technologies field is blank" do
    within(".p_tech") do
      fill_in "Technologies used", with: ""
    end
    click_on "Create Project"
    page.text.must_include "Technologies used can't be blank"
    page.text.must_include "Project could not be saved."
    assert page.has_css?(".error"), "Expected an error message on this page, none found."
  end
end
