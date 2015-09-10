require "test_helper"

feature "Editing a project" do
  before do
    project = projects(:one)
    visit project_path(project)
    click_link "Edit"
  end

  scenario "successfully updates with the changes" do
    within(".p_name") do
      fill_in "Name", with: "First Project"
    end
    within(".p_tech") do
      fill_in "Technologies used", with: "D3"
    end
    click_on "Update Project"
    assert page.has_css?(".notice"), "Expected a flash message, non found."
    page.text.must_include "Project was sucessfully updated."
    page.text.must_include "First Project"
    page.text.must_include "D3"
  end

  it "with incorrect values returns error message" do
    within(".p_name") do
      fill_in "Name", with: "The"
    end
    within(".p_tech") do
      fill_in "Technologies used", with: ""
    end
    click_on "Update Project"
    page.text.must_include "Name is too short (minimum is 4 characters)"
    page.text.must_include "Technologies used can't be blank"
  end
end
