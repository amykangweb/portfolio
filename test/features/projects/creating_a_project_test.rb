require "test_helper"

feature "Adding portfolio item" do
  before do
    visit projects_path
    click_on "New Project"
  end
# http://stackoverflow.com/questions/24853066/having-trouble-testing-upload-file-with-capybara-attach-file-method
  scenario "returns success message and correct content" do
    within(".p_name") do
      fill_in "Name", with: "Code Fellows Project"
    end
    within(".p_tech") do
      fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5"
    end
    page.attach_file('project[thumbnail]', Rails.root + 'test/fixtures/cat.jpeg')
    page.attach_file('project[image]', Rails.root + 'test/fixtures/cat.jpeg')
    page.attach_file('project[extra]', Rails.root + 'test/fixtures/cat.jpeg')
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "Code Fellows Project"
    page.text.must_include "Rails, Ruby, Bootstrap, HTML5"
    page.find('#image_one')['src'].must_include 'cat.jpeg'
    page.find('#image_two')['src'].must_include 'cat.jpeg'
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
