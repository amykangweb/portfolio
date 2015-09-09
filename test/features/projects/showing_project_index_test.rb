require "test_helper"

feature "Visiting project index page" do
  scenario "shows recent projects" do
    project = projects(:one)
    project.save
    visit projects_path
    page.text.must_include "My Portfolio"
    page.text.must_include project.name
    page.text.must_include project.technologies_used
  end
end
