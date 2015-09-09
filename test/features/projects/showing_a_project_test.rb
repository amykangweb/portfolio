require "test_helper"

feature "Project page" do
  scenario "shows project information" do
    project = projects(:one)
    project.save
    visit project_path(project)
    page.text.must_include project.name
    page.text.must_include project.technologies_used
  end
end
